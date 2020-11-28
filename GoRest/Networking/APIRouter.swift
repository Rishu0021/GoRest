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
    case login
      
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .login :
            return .post
            
        /*case .myProfile :
            return .get
            
        case .updateActivity :
            return .put
            
        case .delete :
            return .delete*/
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .login:
            return "v1/login"
        }
    }
    
    // MARK: - Headers
    var headers: [HTTPHeader]? {
        switch self {
                    
        default:
            return [HTTPHeader(field: HTTPHeaderField.acceptType.rawValue, value: ContentType.json.rawValue),
                    HTTPHeader(field: HTTPHeaderField.contentType.rawValue, value: ContentType.json.rawValue)]
        }
    }
    
}



