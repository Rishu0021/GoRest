//
//  APIRouter.swift
//  GoRest
//
//  Created by Rishu Gupta on 28/11/20.
//

import Foundation

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case contentDisposition = "Content-Disposition"
}

enum ContentType: String {
    case json = "application/json"
    case formData = "form-data"
    case multipartFormData = "multipart/form-data"
}


enum APIRouter {
    // cases for each API request
    case users
    case posts
    case comments
    case todos
    case categories
    case products
    case productCategories
    
    case createUser
      
    
    // MARK: - HTTPMethod(specify method for each API)
    var method: HTTPMethod {
        switch self {
        case .createUser :
            return .post
            
        case .users, .posts, .comments, .todos, .categories, .products, .productCategories :
            return .get
            
        /*case .updateActivity :
            return .put
            
        case .delete :
            return .delete*/
        }
    }
    
    // MARK: - Path(specify endpoints for each API)
    var path: String {
        switch self {
        case .users:
            return "users"
        case .posts:
            return "posts"
        case .comments:
            return "comments"
        case .todos:
            return "todos"
        case .categories:
            return "categories"
        case .products:
            return "products"
        case .productCategories:
            return "product-categories"
        case .createUser:
            return "users"
        }
    }
    
    // MARK: - Headers(specify headers for each API)
    var headers: [HTTPHeader]? {
        switch self {
        
        case .createUser :
            return [HTTPHeader(field: HTTPHeaderField.acceptType.rawValue, value: ContentType.json.rawValue),
                    HTTPHeader(field: HTTPHeaderField.contentType.rawValue, value: ContentType.json.rawValue),
                    HTTPHeader(field: HTTPHeaderField.authentication.rawValue, value: kBearerToken)]
                    
        default:
            return [HTTPHeader(field: HTTPHeaderField.acceptType.rawValue, value: ContentType.json.rawValue),
                    HTTPHeader(field: HTTPHeaderField.contentType.rawValue, value: ContentType.json.rawValue)]
        }
    }
    
}



