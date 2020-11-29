//
//  ProductCategoriesModel.swift
//  GoRest
//
//  Created by Rishu Gupta on 29/11/20.
//

import Foundation

struct ProductCategoriesModel : Codable {
    let code : Int?
    let meta : Meta?
    let data : [ProductCategoryDataModel]?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case meta = "meta"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
        data = try values.decodeIfPresent([ProductCategoryDataModel].self, forKey: .data)
    }

}

struct ProductCategoryDataModel : Codable {
    let id : Int?
    let product_id : Int?
    let category_id : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case product_id = "product_id"
        case category_id = "category_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        product_id = try values.decodeIfPresent(Int.self, forKey: .product_id)
        category_id = try values.decodeIfPresent(Int.self, forKey: .category_id)
    }

}

