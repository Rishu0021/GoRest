//
//  RequestGenerator.swift
//  GoRest
//
//  Created by Rishu Gupta on 28/11/20.
//

import Foundation

protocol RequestGenerator {
    /// Generate API request(necessary parameters, method, url path & request body) for given api route.
    ///
    /// - Parameters:
    ///   - route: APIRouter case.
    ///   - params: Necessary parameters for API call.
    /// - Returns: APIRequest.
    func generateRequest(route : APIRouter, params : [Any?]?) -> APIRequest
}

extension RequestGenerator {

    func generateRequest(route : APIRouter, params : [Any?]?) -> APIRequest {
        switch route {
            
        // For Get Users List
        case .users:
            let request = APIRequest(method: route.method, path: route.path)
            request.headers = route.headers
            return request
            
        // For Get Posts List
        case .posts:
            let request = APIRequest(method: route.method, path: route.path)
            request.headers = route.headers
            return request
            
        // For Get Comments List
        case .comments:
            let request = APIRequest(method: route.method, path: route.path)
            request.headers = route.headers
            return request
            
        // For Get Todos List
        case .todos:
            let request = APIRequest(method: route.method, path: route.path)
            request.headers = route.headers
            return request
            
        // For Get Categories List
        case .categories:
            let request = APIRequest(method: route.method, path: route.path)
            request.headers = route.headers
            return request
            
        // For Get Products List
        case .products:
            let request = APIRequest(method: route.method, path: route.path)
            request.headers = route.headers
            return request
            
        // For Get Product Categories List
        case .productCategories:
            let request = APIRequest(method: route.method, path: route.path)
            request.headers = route.headers
            return request
            
        // Create a new user
        case .createUser:
            let createUserRequest = params?.first as? UserRequest
            let request = APIRequest(method: route.method, path: route.path, body: createUserRequest)
            request.headers = route.headers
            return request
            
        // Update user details
        case .updateUser:
            let createUserRequest = params?.first as? UserRequest
            let request = APIRequest(method: route.method, path: route.path, body: createUserRequest)
            request.headers = route.headers
            return request
            
        // Delete user
        case .deleteUser:
            let request = APIRequest(method: route.method, path: route.path)
            request.headers = route.headers
            return request
        }
    }

}

extension RequestGenerator {
    
    /// Generate Media Objects for Model Data(Dictionary) for multipart request
    /// - Parameter dictionary: dictionary(Model Data)
    /// - Returns: Array of MediaModel.
    func generateMediaObject(forDictionar dictionary : [String : Any]) -> [MediaModel] {
        var medias = [MediaModel]()
        for (key,value) in dictionary {
            if value is Array<Any>, let array = value as? Array<Any>, let media = parse(parameter: array, forKey: key) {
                medias.append(contentsOf: media)
            } else if value is [String: Any], let dictionary = value as? [String: Any], let media = parse(parameter: dictionary, forKey: key) {
                medias.append(contentsOf: media)
            } else if let data = parse(parameter: value), let media = MediaModel(withValue: data, forKey: key) {
                medias.append(media)
            }
        }
        return medias
    }

    
    private func parse<T>(parameter: T) -> String? {
        if parameter is Int, let value = parameter as? Int {
            return value.description
        } else if parameter is Double, let value = parameter as? Double {
            return value.description
        } else if parameter is Float, let value = parameter as? Float {
            return value.description
        } else if parameter is String, let value = parameter as? String {
            return value
        } else if parameter is Bool, let value = parameter as? Bool {
            return NSNumber(value: value).description
        } else {
            return nil
        }
    }

    private func parse<T>(parameter: Array<T>, forKey key: String) -> [MediaModel]? {
        let array = parameter.compactMap { (data) -> MediaModel? in
            guard let value = parse(parameter: data) else { return nil }
            return MediaModel(withValue: value, forKey: key+"[]")
        }
        return array
    }

    private func parse<T>(parameter: [String: T], forKey key: String) -> [MediaModel]? {
        var medias = [MediaModel]()
        for (subKey,value) in parameter {
            if let data = parse(parameter: value), let media = MediaModel(withValue: data, forKey: key+"[\(subKey)]") {
                medias.append(media)
            }
        }
        return medias
    }

}

