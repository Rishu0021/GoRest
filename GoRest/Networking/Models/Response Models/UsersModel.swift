//
//  UsersModel.swift
//  GoRest
//
//  Created by Rishu Gupta on 29/11/20.
//

import Foundation

struct UsersModel : Codable {
    let code : Int?
    let meta : Meta?
    let data : [UserDataModel]?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case meta = "meta"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
        data = try values.decodeIfPresent([UserDataModel].self, forKey: .data)
    }

}

struct UserDataModel : Codable {
    let id : Int?
    let name : String?
    let email : String?
    let gender : String?
    let status : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case email = "email"
        case gender = "gender"
        case status = "status"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}

struct Meta : Codable {
    let pagination : Pagination?

    enum CodingKeys: String, CodingKey {

        case pagination = "pagination"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pagination = try values.decodeIfPresent(Pagination.self, forKey: .pagination)
    }

}

struct Pagination : Codable {
    let total : Int?
    let pages : Int?
    let page : Int?
    let limit : Int?

    enum CodingKeys: String, CodingKey {

        case total = "total"
        case pages = "pages"
        case page = "page"
        case limit = "limit"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        pages = try values.decodeIfPresent(Int.self, forKey: .pages)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        limit = try values.decodeIfPresent(Int.self, forKey: .limit)
    }

}
