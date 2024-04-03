//
//  ContentHuggingCompressionDemoView.swift
//  PracticeApp
//
//  Created by Dhanajit Kapali on 04/04/24.
//

import SwiftUI

struct ContentHuggingCompressionDemoView: View {
    @State private var button1Text = "Button 1"
    @State private var button2Text = "Button 2"
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                // Handle button 1 tap action
            }) {
                Text(button1Text)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true) // Allow button 1 to expand horizontally
            }
            .layoutPriority(1) // Allow button 1 to expand first
            
            Button(action: {
                // Handle button 2 tap action
            }) {
                Text(button2Text)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .fixedSize(horizontal: true, vertical: true) // Prevent button 2 from expanding beyond its intrinsic size
            }
        }
        .frame(width: 300)
        .background(Color.teal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentHuggingCompressionDemoView()
    }
}
