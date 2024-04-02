//
//  TimerUiKit.swift
//  PracticeApp
//
//  Created by Dhanajit Kapali on 02/04/24.
//

import UIKit

class TimerViewController: UIViewController {

    private var elapsedTime: TimeInterval = 0.0
    private var timerIsRunning = false
    private var timer: Timer?

    private let timerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40)
        label.text = "0.0"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(timerLabel)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            timerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            timerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            timerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        let startPauseButton = UIButton()
        startPauseButton.setTitle("Start", for: .normal)
        startPauseButton.setTitleColor(.white, for: .normal)
        startPauseButton.backgroundColor = .green
        startPauseButton.layer.cornerRadius = 10
        startPauseButton.addTarget(self, action: #selector(startPauseButtonTapped), for: .touchUpInside)
        
        let resetButton = UIButton()
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(.white, for: .normal)
        resetButton.backgroundColor = .blue
        resetButton.layer.cornerRadius = 10
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [startPauseButton, resetButton])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    @objc func startPauseButtonTapped() {
        if timerIsRunning {
            timer?.invalidate()
        } else {
            timer = Timer.scheduledTimer(
                timeInterval: 0.1,
                target: self,
                selector: #selector(updateElapsedTime),
                userInfo: nil, repeats: true
            )
        }
        timerIsRunning.toggle()
    }
    
    @objc func resetButtonTapped() {
        timer?.invalidate()
        elapsedTime = 0.0
        timerIsRunning = false
        timerLabel.text = String(format: "%.1f", elapsedTime)
    }
    
    @objc func updateElapsedTime() {
        elapsedTime += 0.1
        timerLabel.text = String(format: "%.1f", elapsedTime)
    }
}


#Preview {
    TimerViewController()
}
