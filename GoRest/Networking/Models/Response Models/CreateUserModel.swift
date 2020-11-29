//
//  CreateUserModel.swift
//  GoRest
//
//  Created by Rishu Gupta on 29/11/20.
//

import Foundation

struct CreateUserModel : Codable {
    let code : Int?
    let meta : String?
    let data : UserDataModel?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case meta = "meta"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        meta = try values.decodeIfPresent(String.self, forKey: .meta)
        data = try values.decodeIfPresent(UserDataModel.self, forKey: .data)
    }

}
