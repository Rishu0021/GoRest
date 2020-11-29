//
//  APIClient.swift
//  GoRest
//
//  Created by Rishu Gupta on 28/11/20.
//

import Foundation

public typealias APICompletion = (Response) -> Void

public struct Response {
    let data: Data?
    let response: URLResponse?
    let error: Error?
    
    init(_ data: Data?, _ response: URLResponse?, _ error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }
}

struct APIClient {
            
    /// Sends a request to servers, calling the completion method when finished
    @discardableResult
    func send(_ request: APIRequest, completion: @escaping APICompletion) -> URLSessionDataTask? {
        
        // Checking internet connection availability
        if !InternetConnectionManager.isConnectedToNetwork() {
            completion(Response(nil, nil, APIError.NoInternet))
            return nil
        }
        
        let baseUrl = AppEnvironment.baseURL
        var urlComponents = URLComponents()
        urlComponents.scheme = baseUrl.scheme
        urlComponents.host = baseUrl.host
        urlComponents.path = baseUrl.path
        urlComponents.port = baseUrl.port
        urlComponents.queryItems = request.queryItems

        guard let url = urlComponents.url?.appendingPathComponent(request.path) else {
            completion(Response(nil, nil, APIError.InvalidUrl))
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.httpBody = request.body
        urlRequest.timeoutInterval = 60
        urlRequest.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
        //urlRequest.httpShouldHandleCookies = true

        request.headers?.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.field) }
        
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        
        if request.isMultipart == true, let medias = request.medias {
            urlRequest.httpBody = self.createMultipartBody(medias: medias, boundary: self.boundary)
        }
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            print("Curl: ", urlRequest.curlString)
            completion(Response(data, response, error))
        }
        task.resume()
        return task
    }
}

extension APIClient {
    
    private var boundary: String {
        return "Boundary-\(UUID().uuidString)"
    }
    
    private func createMultipartBody(medias: [MediaModel], boundary: String = "Boundary-\("562F49C8-26CD-4D87-9C8F-DEA380DE4BF007")") -> Data {
        var body = Data()
        let lineBreak = "\r\n"
        
        medias.forEach { (media) in
            let boundaryPrefix = "--\(boundary + lineBreak)"
            body.append(boundaryPrefix)
            
            if let fileName = media.fileName, let mimeType = media.mimeType {
                body.append("Content-Disposition: form-data; name=\"\(media.key)\"; filename=\"\(fileName)\"\(lineBreak)")
                body.append("Content-Type: \(mimeType + lineBreak + lineBreak)")
            } else {
                body.append("Content-Disposition: form-data; name=\"\(media.key)\"\(lineBreak + lineBreak)")
                body.append("Content-Type: \("application/json;charset=utf-8")\(lineBreak + lineBreak)")
            }
            
            body.append(media.data)
            body.append(lineBreak)
        }
        
        body.append("--\(boundary)--\(lineBreak)")
        return body
    }
    
}

extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}

extension URLRequest {
    /**
     Returns a cURL command representation of this URL request.
     */
    public var curlString: String {
        // Logging URL requests in whole may expose sensitive data,
        // or open up possibility for getting access to your user data,
        // so make sure to disable this feature for production builds!
        #if !DEBUG
            return ""
        #else
            var result = "curl -k "

            if let method = httpMethod {
                result += "-X \(method) \\\n"
            }

            if let headers = allHTTPHeaderFields {
                for (header, value) in headers {
                    result += "-H \"\(header): \(value)\" \\\n"
                }
            }

            if let body = httpBody, !body.isEmpty, let string = String(data: body, encoding: .utf8), !string.isEmpty {
                result += "-d '\(string)' \\\n"
            }

            if let url = url {
                result += url.absoluteString
            }

            return result
        #endif
    }
    
}

