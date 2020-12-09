//
//  UserRequest.swift
//  GoRest
//
//  Created by Rishu Gupta on 29/11/20.
//

import Foundation

struct UserRequest : Codable {
    let name : String?
    let gender : String?
    let email : String?
    let status : String?

    init(name : String? = nil, gender : String? = nil, email : String? = nil, status : String? = nil) {
        self.name = name
        self.gender = gender
        self.email = email
        self.status = status
    }
}
