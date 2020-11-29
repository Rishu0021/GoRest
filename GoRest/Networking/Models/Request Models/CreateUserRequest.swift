//
//  CreateUserRequest.swift
//  GoRest
//
//  Created by Rishu Gupta on 29/11/20.
//

import Foundation

struct CreateUserRequest : Codable {
    let name : String?
    let gender : String?
    let email : String?
    let status : String?

    init(name : String?, gender : String?, email : String?, status : String?) {
        self.name = name
        self.gender = gender
        self.email = email
        self.status = status
    }
}
