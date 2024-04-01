//
//  TimerDemo.swift
//  PracticeApp
//
//  Created by Dhanajit Kapali on 01/04/24.
//

import SwiftUI

struct TimerDemo: View {
    @State private var elapsedTime: TimeInterval = 0.0
    @State private var timerIsRunning = false
    @State private var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text(String(format: "%.1f", elapsedTime))
                .font(.largeTitle)
                .padding()
            
            HStack {
                Button(action: {
                    if self.timerIsRunning {
                        self.timer.upstream.connect().cancel()
                    } else {
                        self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
                    }
                    self.timerIsRunning.toggle()
                }) {
                    Text(timerIsRunning ? "Pause" : "Start")
                        .padding()
                        .foregroundColor(.white)
                        .background(timerIsRunning ? Color.red : Color.green)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    self.timer.upstream.connect().cancel()
                    self.elapsedTime = 0.0
                    self.timerIsRunning = false
                }) {
                    Text("Reset")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
        .onReceive(timer) { _ in
            if self.timerIsRunning {
                self.elapsedTime += 0.1
            }
        }
    }
}

struct TimerDemo_Previews: PreviewProvider {
    static var previews: some View {
        TimerDemo()
    }
}
