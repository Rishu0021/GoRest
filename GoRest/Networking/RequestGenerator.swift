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
            
        // For Login OTP Verify
        case .login:
            //let loginRequest = params?.first as? LoginRequest
            let request = APIRequest(method: route.method, path: route.path)//, body: loginRequest)
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

