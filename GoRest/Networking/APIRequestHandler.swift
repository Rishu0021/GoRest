//
//  APIRequestHandler.swift
//  GoRest
//
//  Created by Rishu Gupta on 28/11/20.
//

import Foundation

/// Response completion handler.
typealias CallResponse<T> = (Result<T>) -> Void

/// API protocol, The alamofire wrapper
protocol APIRequestHandler: RequestGenerator, ResponseHandler {
    /// Calling network layer via (URLSessionDataTask), this implementation can be replaced anytime in one place which is the protocol itself, applied anywhere.
    ///
    /// - Parameters:
    ///   - decoder: Codable confirmed class/struct, Model.type.
    ///   - completion: Results of the request, general errors cases handled.
    /// - Returns: URLSessionDataTask.
    func sendRequest<T: Decodable>(route: APIRouter, _ decoder: T.Type, _ params: Any?..., completion: @escaping CallResponse<T>) -> URLSessionDataTask?
}

extension APIRequestHandler {
    
    @discardableResult
    func sendRequest<T: Decodable>(route: APIRouter, _ decoder: T.Type, _ params: Any?..., completion: @escaping CallResponse<T>) -> URLSessionDataTask? {
        
        /// Generate API Request data
        let request = self.generateRequest(route: route, params: params)
        
        /// Perform API call to server with generated request
        let client = APIClient().send(request) { (response) in
            self.handleResponse(response, decoder, completion: completion)
        }
        return client
    }
    
    /*func cancelRequest() -> Void {
        let sessionManager = Session.default
        sessionManager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
            dataTasks.first(where: { $0.originalRequest?.url == self.requestURL})?.cancel()
            uploadTasks.first(where: { $0.originalRequest?.url == self.requestURL})?.cancel()
            downloadTasks.first(where: { $0.originalRequest?.url == self.requestURL})?.cancel()
        }
     }*/
}

