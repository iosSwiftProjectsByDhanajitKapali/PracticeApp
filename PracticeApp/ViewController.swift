//
//  ViewController.swift
//  PracticeApp
//
//  Created by Dhanajit Kapali on 22/03/24.
//

import UIKit

class ViewController: UIViewController {

    // Data to show
    private var data = [Int]()
    
    // TableView to show data
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    // Pagination
    var curretnPage = 1
    let pageSize = 20
    var isFetchingData = false // Flag to prevent multiple API calls
}


// MARK: - View LifeCyle methods
extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        // Fetch Data from API
        fetchData()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.frame
    }
}


// MARK: - Private Methods
extension ViewController {
    private func fetchData() {
        guard !isFetchingData else { return }
        isFetchingData = true
        
        // Add Loader
        tableView.tableFooterView = createSpinnerView()
        
        // Call api to get data
        APIService().getData(pageNo: curretnPage) { res in
            switch res {
            case .success(let data):
                DispatchQueue.main.async { [weak self] in
                    self?.data.append(contentsOf: data)
                    self?.curretnPage += 1
                    self?.tableView.reloadData()
                    self?.tableView.tableFooterView = nil
                    self?.isFetchingData = false
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    private func createSpinnerView() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.startAnimating()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        return footerView
    }
}


// MARK: - UITableViewDataSource methods
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
}

// MARK: - UITableViewDelegate methods
extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offSetY > contentHeight - scrollView.frame.height {  // Wen user reaches the end of tableView
            fetchData()
        }
    }
}

