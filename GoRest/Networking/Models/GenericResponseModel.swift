//
//  GenericResponseModel.swift
//  GoRest
//
//  Created by Rishu Gupta on 28/11/20.
//

import Foundation

struct GenericResponseModel : Codable {
    let message : String?
    let success : Bool?

    enum CodingKeys: String, CodingKey {

        case message = "message"
        case success = "success"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        
    }

}
