//
//  APIRequest.swift
//  GoRest
//
//  Created by Rishu Gupta on 28/11/20.
//

import UIKit

struct HTTPHeader {
    let field: String
    let value: String
}

class APIRequest {
    let method: HTTPMethod
    let path: String
    var queryItems: [URLQueryItem]?
    var headers: [HTTPHeader]?
    var body: Data?
    var isMultipart : Bool = false
    var medias: [MediaModel]?

    init(method: HTTPMethod, path: String) {
        self.method = method
        self.path = path
    }

    init<Body: Codable>(method: HTTPMethod, path: String, body: Body) {
        self.method = method
        self.path = path
        self.body = try? JSONEncoder().encode(body)
    }
}

