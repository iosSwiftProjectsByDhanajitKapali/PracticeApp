//
//  MyOptional.swift
//  PracticeApp
//
//  Created by Dhanajit Kapali on 03/04/24.
//

import Foundation

enum MyOptional<T> {
    case some(T)
    case none
    
    init(_ value: T?) {
        if let value = value {
            self = .some(value)
        } else {
            self = .none
        }
    }
    
    func unwrap(default defaultValue: T) -> T {
        switch self {
        case .some(let value):
            return value
        case .none:
            return defaultValue
        }
    }
}
