//
//  TimerDemo.swift
//  PracticeApp
//
//  Created by Dhanajit Kapali on 01/04/24.
//

import SwiftUI

struct TimerDemo: View {
    
    @State private var elapsedTime: TimeInterval = 0.0
    @State var isTimerRunning = false
    @State private var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            timerDisplayView()
            VStack {
                startStopButtonView()
                resetButtonView()
                    .disabled(isTimerRunning)
                    .padding(10)
                Spacer()
            }
            .padding(.top, 50)
        }
        .onReceive(timer) { _ in
            if self.isTimerRunning {
                self.elapsedTime += 0.1
            }
        }
    }
    
    @ViewBuilder func timerDisplayView() -> some View {
        Text(String(format: "%.1f", elapsedTime))
            .font(.largeTitle)
            .padding()
            .padding(.top, 100)
    }
    
    @ViewBuilder func startStopButtonView() -> some View {
        Button {
            if self.isTimerRunning {
                self.timer.upstream.connect().cancel()
            } else {
                self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
            }
            self.isTimerRunning.toggle()
        } label: {
            if isTimerRunning {
                Text("Stop")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(.red)
                    .cornerRadius(15)
            } else {
                Text("Start")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(.green)
                    .cornerRadius(15)
            }
        }
    }
    
    @ViewBuilder func resetButtonView() -> some View {
        Button {
            self.timer.upstream.connect().cancel()
            self.elapsedTime = 0.0
            self.isTimerRunning = false
        } label: {
            Text("Reset")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(!isTimerRunning ? .blue : .gray)
                .cornerRadius(15)
        }
    }
}

#Preview {
    TimerDemo()
}
