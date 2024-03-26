//
//  ViewController.swift
//  PracticeApp
//
//  Created by Dhanajit Kapali on 22/03/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        testSwiftUi()
    }

    func testSwiftUi() {
        let vc = UIHostingController(rootView: SwiftUIView())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}

