//
//  GridViewDemo.swift
//  PracticeApp
//
//  Created by Dhanajit Kapali on 03/04/24.
//

import SwiftUI

struct GridViewDemo: View {
    /*
     1- By Default the gridItems are .flexible with(min = 10 and max = .infinity)
        The no of GridItems define the no of coloumns and rows as per the VGrid and HGrid
     2- .fixed -> set fixed size of item
     3- .adpative -> will takeup the available space as per the defined GridItem
     */
    
    let coloumns: [GridItem] = [
        GridItem(.flexible(minimum: 20, maximum:50)),
        GridItem(.flexible(minimum: 20, maximum:100)),
    ]
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(
                columns: coloumns,
                content: {
                    ForEach(0..<50) { num in
                        Rectangle()
                            .fill()
                            .frame(height: 100)
                    }
            })
        }
        .padding(10)
        .frame(width: 250)
        .background(.teal)
        
    }
}

#Preview {
    GridViewDemo()
}

struct GridViewDemoFixed: View {
    /*
     1- By Default the gridItems are .flexible with(min = 10 and max = .infinity)
        The no of GridItems define the no of coloumns and rows as per the VGrid and HGrid
     2- .fixed -> set fixed size of item
     3- .adpative -> will takeup the available space as per the defined GridItem
     */
    
    let coloumns: [GridItem] = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(
                columns: coloumns,
                content: {
                    ForEach(0..<50) { num in
                        Rectangle()
                            .fill()
                            .frame(height: 100)
                    }
            })
        }
        .padding(10)
        .background(.teal)
    }
}

#Preview {
    GridViewDemoFixed()
}

struct GridViewDemoAdaptive: View {
    /*
     1- By Default the gridItems are .flexible with(min = 10 and max = .infinity)
        The no of GridItems define the no of coloumns and rows as per the VGrid and HGrid
     2- .fixed -> set fixed size of item
     3- .adpative -> will takeup the available space as per the defined GridItem
     */
    
    let coloumns: [GridItem] = [
        GridItem(.adaptive(minimum: 100, maximum: 100)),
        GridItem(.adaptive(minimum: 50, maximum: 100)),
    ]
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(
                columns: coloumns,
                content: {
                    ForEach(0..<50) { num in
                        Rectangle()
                            .fill()
                            .frame(height: 100)
                    }
            })
        }
        .padding(10)
        .frame(width: 250)
        .background(.teal)
    }
}

#Preview {
    GridViewDemoAdaptive()
}

