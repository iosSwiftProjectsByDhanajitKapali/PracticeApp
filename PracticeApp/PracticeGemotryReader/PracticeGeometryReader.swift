//
//  PracticeGeometryReader.swift
//  PracticeApp
//
//  Created by Dhanajit Kapali on 27/03/24.
//

import SwiftUI

struct PracticeGeometryReader: View {
    @State private var sliderVal: Double = 4.0
    var body: some View {
        VStack {
            Slider(value: $sliderVal, in: 1...4, step: 1.0)
            GeometryReader { geo in
                LazyVGrid(
                    columns: Array(
                        repeating: GridItem(.flexible()),
                        count: Int(sliderVal)
                    ),
                    content: {
                        ForEach(0..<10) { num in
                            Rectangle()
                                .fill(Color.random()) // Customize fill color if needed
                                .aspectRatio(1.0, contentMode: .fit)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                })
            }
            Spacer()
        }
    }
}

#Preview {
    PracticeGeometryReader()
}

import SwiftUI

extension Color {
    static func random() -> Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(red: red, green: green, blue: blue)
    }
}
