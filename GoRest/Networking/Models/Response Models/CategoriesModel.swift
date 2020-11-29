//
//  CategoriesModel.swift
//  GoRest
//
//  Created by Rishu Gupta on 29/11/20.
//

import Foundation

struct CategoriesModel : Codable {
    let code : Int?
    let meta : Meta?
    let data : [CategoryDataModel]?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case meta = "meta"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
        data = try values.decodeIfPresent([CategoryDataModel].self, forKey: .data)
    }

}

struct CategoryDataModel : Codable {
    let id : Int?
    let name : String?
    let description : String?
    let status : Bool?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case description = "description"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
    }

}
