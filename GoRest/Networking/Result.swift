//
//  Result.swift
//  GoRest
//
//  Created by Rishu Gupta on 28/11/20.
//

import Foundation

enum Result<Body> {
    case success(Body)
    case failure(APIError)
}

//enum Result<Success, Failure> where Failure : Error {
//    case success(Success)
//    case failure(Failure)
//}
