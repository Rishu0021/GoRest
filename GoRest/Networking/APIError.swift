//
//  APIError.swift
//  GoRest
//
//  Created by Rishu Gupta on 28/11/20.
//

import Foundation

/// Dumb error to model simple errors
/// In a real implementation this should be more exhaustive
enum APIError: Error {
    case InvalidUrl
    case NoInternet
    case Encoding(String)
    case Decoding(String)
    case UnAuthorized(String)
    case Server(String)
    case Other(String)
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .InvalidUrl:
            return NSLocalizedString("Unable to create the URLRequest object", comment: "")
        case .NoInternet:
            return NSLocalizedString("Unable to create the URLRequest object", comment: "")
        case .Encoding(let message), .Decoding(let message), .UnAuthorized(let message), .Server(let message), .Other(let message):
            return NSLocalizedString(message, comment: "")
        }
    }
}
