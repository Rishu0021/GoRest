//
//  ProductsModel.swift
//  GoRest
//
//  Created by Rishu Gupta on 29/11/20.
//

import Foundation

struct ProductsModel : Codable {
    let code : Int?
    let meta : Meta?
    let data : [ProductDataModel]?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case meta = "meta"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
        data = try values.decodeIfPresent([ProductDataModel].self, forKey: .data)
    }

}

struct ProductDataModel : Codable {
    let id : Int?
    let name : String?
    let description : String?
    let image : String?
    let price : String?
    let discount_amount : String?
    let status : Bool?
    let categories : [ProductCategoryModel]?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case description = "description"
        case image = "image"
        case price = "price"
        case discount_amount = "discount_amount"
        case status = "status"
        case categories = "categories"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        discount_amount = try values.decodeIfPresent(String.self, forKey: .discount_amount)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        categories = try values.decodeIfPresent([ProductCategoryModel].self, forKey: .categories)
    }

}

struct ProductCategoryModel : Codable {
    let id : Int?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }

}
