//
//  ContentHuggingCompressionDemoViewController.swift
//  PracticeApp
//
//  Created by Dhanajit Kapali on 04/04/24.
//

import UIKit

class ContentHuggingCompressionDemoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
         //Create the first button
        let button1 = UIButton(type: .system)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitle("Button 1", for: .normal)
        button1.backgroundColor = .blue
        view.addSubview(button1)
        
        // Create the second button
        let button2 = UIButton(type: .system)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setTitle("Button 2", for: .normal)
        button2.backgroundColor = .red
        view.addSubview(button2)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            // Button 1 constraints
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button1.topAnchor.constraint(equalTo: view.topAnchor),
            button1.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Button 2 constraints
            button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor),
            button2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button2.topAnchor.constraint(equalTo: view.topAnchor),
            button2.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            button2.widthAnchor.constraint(equalTo: button1.widthAnchor) // Ensure both buttons have equal widths initially
        ])
        
        // Set content hugging and compression resistance priorities
        button1.setContentHuggingPriority(.defaultLow, for: .horizontal)
        button1.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        button2.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        button2.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
}

#Preview {
    ContentHuggingCompressionDemoViewController()
}

