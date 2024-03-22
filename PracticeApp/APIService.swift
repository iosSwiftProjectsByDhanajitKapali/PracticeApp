//
//  APIService.swift
//  PracticeApp
//
//  Created by Dhanajit Kapali on 22/03/24.
//

import Foundation

class APIService {
    func getData(pageNo: Int, completionHandler: @escaping(Result<[Int], Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 5, execute: {
            var resultArray = [Int]()
            for i in 1...20 {
                resultArray.append(pageNo * i)
            }
            completionHandler(.success(resultArray))
        })
    }
}
