//
//  ValidationErrorModel.swift
//  GoRest
//
//  Created by Rishu Gupta on 29/11/20.
//

import Foundation

struct ValidationModel : Codable {
    let code : Int?
    let meta : String?
    let data : [ValidationDataModel]?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case meta = "meta"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        meta = try values.decodeIfPresent(String.self, forKey: .meta)
        data = try values.decodeIfPresent([ValidationDataModel].self, forKey: .data)
    }

}

struct ValidationDataModel : Codable {
    let field : String?
    let message : String?
    
    var displayMessage: String? {
        guard let field = self.field, let message = self.message else { return nil }
        return field + " " + message
    }

    enum CodingKeys: String, CodingKey {

        case field = "field"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        field = try values.decodeIfPresent(String.self, forKey: .field)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}
