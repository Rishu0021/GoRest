//
//  ResponseHandler.swift
//  GoRest
//
//  Created by Rishu Gupta on 28/11/20.
//

import Foundation

protocol ResponseHandler {
    /// Handles request response, never called anywhere but APIRequestHandler
    ///
    /// - Parameters:
    ///   - response: response from network request, for now URLSessionDataTask response
    ///   - completion: completing processing the json response, and delivering it in the completion handler
    func handleResponse<T: Decodable>(_ response: Response, _ decoder: T.Type, completion: CallResponse<T>)
}

extension ResponseHandler {
    
    func handleResponse<T: Decodable>(_ result: Response, _ decoder: T.Type, completion: CallResponse<T>) {
        
        let statusCode = (result.response as? HTTPURLResponse)?.statusCode ?? 0
        print("\nStatus Code : --- \(statusCode)")
        
        if let data = result.data {
            if let response = String(data: data, encoding: .utf8) {
                print("\nResponse : ", response)
            }
            do {
                switch statusCode {
                case 200...299:
                    let model = try JSONDecoder().decode(decoder.self, from: data)
                    completion(.success(model))
                default:
                    let model = try JSONDecoder().decode(ErrorModel.self, from: data)
                    if statusCode == StatusCode.APIValidationFailed.rawValue {
                        let message = model.errors?.error ?? model.message
                        //ValidationError
                        completion(.failure(.Server(message ?? errorMessage(for: statusCode))))
                    } else if statusCode == StatusCode.Conflict.rawValue {
                        //DuplicationError
                        completion(.failure(.Server(model.message ?? errorMessage(for: statusCode))))
                    } else if statusCode == StatusCode.Unauthorized.rawValue {
                        //Unauthorized
                        completion(.failure(.UnAuthorized(model.message ?? errorMessage(for: statusCode))))
                    } else {
                        completion(.failure(.Other(model.message ?? errorMessage(for: statusCode))))
                    }
                }
            } catch let error {
                let model = try? JSONDecoder().decode(ValidationModel.self, from: data)
                if model?.code == StatusCode.APIValidationFailed.rawValue {
                    let errors = model?.data?.compactMap({ ($0.displayMessage) })
                    let message = errors?.joined(separator: ", ")
                    //ValidationError
                    completion(.failure(.Server(message ?? errorMessage(for: statusCode))))
                    return
                }
                //"Failed to decode response"
                print("print error \(String(describing: error))")
                completion(.failure(.Decoding(error.localizedDescription)))
            }
        } else if let error = result.error {
            //"Error performing network request"
            print("print error \(String(describing: error.localizedDescription))")
            completion(.failure(.Server(error.localizedDescription)))
        } else {
            completion(.failure(.Other(errorMessage(for: statusCode))))
        }
        
    }
}
