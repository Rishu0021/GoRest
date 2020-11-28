//
//  ErrorModel.swift
//  GoRest
//
//  Created by Rishu Gupta on 28/11/20.
//

import Foundation

struct ErrorModel : Decodable {
    let error : String?
    let error_description : String?
    let message : String?
    
    let errors : ValidationErrorModel?

    enum CodingKeys: String, CodingKey {

        case error = "error"
        case error_description = "error_description"
        case message = "message"
        case errors = "errors"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        error = try values.decodeIfPresent(String.self, forKey: .error)
        error_description = try values.decodeIfPresent(String.self, forKey: .error_description)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        
        errors = try values.decodeIfPresent(ValidationErrorModel.self, forKey: .errors)
        
    }
    

}

struct ValidationErrorModel: Decodable {
    var error: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: GenericCodingKeys.self)
        self.error = (try container.allKeys.compactMap { (try container.decode([String].self, forKey: $0)).first }).first
        
    }
}

// A struct that conforms to the CodingKey protocol
// It defines no key by itself, hence the name "Generic"
struct GenericCodingKeys: CodingKey {
    var stringValue: String
    var intValue: Int?

    init?(stringValue: String) { self.stringValue = stringValue }
    init?(intValue: Int) { self.intValue = intValue; self.stringValue = intValue.description }
}
