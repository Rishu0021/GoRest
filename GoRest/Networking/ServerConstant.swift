//
//  ServerConstant.swift
//  GoRest
//
//  Created by Rishu Gupta on 28/11/20.
//

import Foundation

enum Environment {
  case LOCAL
  case DEV
  case UAT
  case PROD
}

// Open Sample Urls for testing
// https://gorest.co.in/

class AppEnvironment {
    #if LOCAL
        static let environment: Environment = .LOCAL
        static let baseURL: URL = URL(string: "https://gorest.co.in/public-api/")!
    #elseif DEV
        static let environment: Environment = .DEV
        static let baseURL: URL = URL(string: "https://gorest.co.in/public-api/")!
    #elseif PROD
       static let environment: Environment = .PROD
       static let baseURL: URL = URL(string: "https://gorest.co.in/public-api/")!
    #else
        static let environment: Environment = .LOCAL
        static let baseURL: URL = URL(string: "https://gorest.co.in/public-api/")!
    #endif
    
    static let APIAccessToken: String = "668064fd8ba3fe40c44de33f1020edfd04b933a442893aa24ec959f2cdbd35ec"
}

var kBearerToken : String {
    let accessToken = AppEnvironment.APIAccessToken
    let token =  "Bearer \(accessToken)"
    return token
}

enum ResponseType {
    case Success
    case Failure
    case ValidationError
    case DuplicationError
}

typealias CompletionHandler = (_ responseType : ResponseType, _ message: String?, _ response: Any?) -> Void


func errorMessage(for statusCode: Int) -> String {
    
    switch statusCode {
    case StatusCode.Accepted.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.Accepted.message, statusCode)
    case StatusCode.TooManyRequests.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.TooManyRequests.message, statusCode)
    case StatusCode.BadGateway.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.BadGateway.message, statusCode)
    case StatusCode.BadRequest.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.BadRequest.message, statusCode)
    case StatusCode.Conflict.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.Conflict.message, statusCode)
    case StatusCode.Continue.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.Continue.message, statusCode)
    case StatusCode.Created.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.Created.message, statusCode)
    case StatusCode.ExpectationFailed.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.ExpectationFailed.message, statusCode)
    case StatusCode.Forbidden.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.Forbidden.message, statusCode)
    case StatusCode.Found.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.Found.message, statusCode)
    case StatusCode.GatewayTimeout.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.GatewayTimeout.message, statusCode)
    case StatusCode.Gone.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.Gone.message, statusCode)
    case StatusCode.HTTPVersionNotSupported.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.HTTPVersionNotSupported.message, statusCode)
    case StatusCode.InternalServerError.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.InternalServerError.message, statusCode)
    case StatusCode.LengthRequired.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.LengthRequired.message, statusCode)
    case StatusCode.MethodNotAllowed.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.MethodNotAllowed.message, statusCode)
    case StatusCode.MovedPermanently.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.MovedPermanently.message, statusCode)
    case StatusCode.MultipleChoices.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.MultipleChoices.message, statusCode)
    case StatusCode.NoContent.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.NoContent.message, statusCode)
    case StatusCode.NonAuthoritativeInformation.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.NonAuthoritativeInformation.message, statusCode)
    case StatusCode.NotAcceptable.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.NotAcceptable.message, statusCode)
    case StatusCode.NotFound.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.NotFound.message, statusCode)
    case StatusCode.NotImplemented.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.NotImplemented.message, statusCode)
    case StatusCode.NotModified.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.NotModified.message, statusCode)
    case StatusCode.PartialContent.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.PartialContent.message, statusCode)
    case StatusCode.PaymentRequired.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.PaymentRequired.message, statusCode)
    case StatusCode.PreconditionFailed.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.PreconditionFailed.message, statusCode)
    case StatusCode.ProxyAuthenticationRequired.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.ProxyAuthenticationRequired.message, statusCode)
    case StatusCode.RequestedRangeNotSatisfiable.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.RequestedRangeNotSatisfiable.message, statusCode)
    case StatusCode.RequestEntityTooLarge.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.RequestEntityTooLarge.message, statusCode)
    case StatusCode.RequestTimeout.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.RequestTimeout.message, statusCode)
    case StatusCode.RequestURITooLong.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.RequestURITooLong.message, statusCode)
    case StatusCode.ResetContent.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.ResetContent.message, statusCode)
    case StatusCode.SeeOther.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.SeeOther.message, statusCode)
    case StatusCode.ServiceUnavailable.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.ServiceUnavailable.message, statusCode)
    case StatusCode.SwitchingProtocols.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.SwitchingProtocols.message, statusCode)
    case StatusCode.TemporaryRedirect.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.TemporaryRedirect.message, statusCode)
    case StatusCode.Unauthorized.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.Unauthorized.message, statusCode)
    case StatusCode.UnsupportedMediaType.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.UnsupportedMediaType.message, statusCode)
    case StatusCode.Unused.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.Unused.message, statusCode)
    case StatusCode.UseProxy.rawValue:
        return String.init(format: "%@ (%d)", StatusCode.UseProxy.message, statusCode)
    default:
        return String.init(format: "Something went wrong (%d)", statusCode)
    }
    
}

/*
 Http Response Codes Summary
 200: OK. Everything worked as expected.
 201: A resource was successfully created in response to a POST request. The Location header contains the URL pointing to the newly created resource.
 204: The request was handled successfully and the response contains no body content (like a DELETE request).
 304: The resource was not modified. You can use the cached version.
 400: Bad request. This could be caused by various actions by the user, such as providing invalid JSON data in the request body, providing invalid action parameters, etc.
 401: Authentication failed.
 403: The authenticated user is not allowed to access the specified API endpoint.
 404: The requested resource does not exist.
 405: Method not allowed. Please check the Allow header for the allowed HTTP methods.
 415: Unsupported media type. The requested content type or version number is invalid.
 422: Data validation failed (in response to a POST request, for example). Please check the response body for detailed error messages.
 429: Too many requests. The request was rejected due to rate limiting.
 500: Internal server error. This could be caused by internal program errors.
 */

enum StatusCode: Int {
    case Continue = 100
    case SwitchingProtocols = 101
    case OK = 200
    case Created = 201
    case Accepted = 202
    case NonAuthoritativeInformation = 203
    case NoContent = 204
    case ResetContent = 205
    case PartialContent = 206
    case MultipleChoices = 300
    case MovedPermanently = 301
    case Found = 302
    case SeeOther = 303
    case NotModified = 304
    case UseProxy = 305
    case Unused = 306
    case TemporaryRedirect = 307
    case BadRequest = 400
    case Unauthorized = 401
    case PaymentRequired = 402
    case Forbidden = 403
    case NotFound = 404
    case MethodNotAllowed = 405
    case NotAcceptable = 406
    case ProxyAuthenticationRequired = 407
    case RequestTimeout = 408
    case Conflict = 409
    case Gone = 410
    case LengthRequired = 411
    case PreconditionFailed = 412
    case RequestEntityTooLarge = 413
    case RequestURITooLong = 414
    case UnsupportedMediaType = 415
    case RequestedRangeNotSatisfiable = 416
    case ExpectationFailed = 417
    case APIValidationFailed = 422
    case TooManyRequests = 429
    case InternalServerError = 500
    case NotImplemented = 501
    case BadGateway = 502
    case ServiceUnavailable = 503
    case GatewayTimeout = 504
    case HTTPVersionNotSupported = 505
    
    var message: String {
        switch self {
        case .Continue:
            return "Continue."
        case .SwitchingProtocols:
            return "Switching protocols."
        case .OK:
            return "OK. Everything worked as expected."
        case .Created:
            return "A resource was successfully created in response to a POST request. The Location header contains the URL pointing to the newly created resource."
        case .Accepted:
            return "Accepted."
        case .NonAuthoritativeInformation:
            return "Non authoritative information."
        case .NoContent:
            return "The request was handled successfully and the response contains no body content (like a DELETE request)."
        case .ResetContent:
            return "Reset content."
        case .PartialContent:
            return "Partial content."
        case .MultipleChoices:
            return "Multiple Choices."
        case .MovedPermanently:
            return "Moved permanently."
        case .Found:
            return "Found."
        case .SeeOther:
            return "See other."
        case .NotModified:
            return "The resource was not modified. You can use the cached version."
        case .UseProxy:
            return "Use proxy."
        case .Unused:
            return "(Unused)."
        case .TemporaryRedirect:
            return "Temporary redirect."
        case .BadRequest:
            return "Bad request. This could be caused by various actions by the user, such as providing invalid JSON data in the request body, providing invalid action parameters, etc."
        case .Unauthorized:
            return "Authentication failed."
        case .PaymentRequired:
            return "Payment required."
        case .Forbidden:
            return "The authenticated user is not allowed to access the specified API endpoint."
        case .NotFound:
            return "The requested resource does not exist."
        case .MethodNotAllowed:
            return "Method not allowed. Please check the Allow header for the allowed HTTP methods."
        case .NotAcceptable:
            return "Not acceptable."
        case .ProxyAuthenticationRequired:
            return "Proxy authentication required."
        case .RequestTimeout:
            return "Request timeout."
        case .Conflict:
            return "Conflict."
        case .Gone:
            return "Gone."
        case .LengthRequired:
            return "Length required."
        case .PreconditionFailed:
            return "Precondition failed."
        case .RequestEntityTooLarge:
            return "Request entity too large."
        case .RequestURITooLong:
            return "Request-URI too long."
        case .UnsupportedMediaType:
            return "Unsupported media type. The requested content type or version number is invalid."
        case .RequestedRangeNotSatisfiable:
            return "Requested range not satisfiable."
        case .ExpectationFailed:
            return "Expectation failed."
        case .APIValidationFailed:
            return "Data validation failed (in response to a POST request, for example). Please check the response body for detailed error messages."
        case .TooManyRequests:
            return "Too many requests. The request was rejected due to rate limiting."
        case .InternalServerError:
            return "Internal server error. This could be caused by internal program errors."
        case .NotImplemented:
            return "Not implemented."
        case .BadGateway:
            return "Bad gateway."
        case .ServiceUnavailable:
            return "Service unavailable."
        case .GatewayTimeout:
            return "Gateway timeout."
        case .HTTPVersionNotSupported:
            return "HTTP version not supported."
        }
    }
}
