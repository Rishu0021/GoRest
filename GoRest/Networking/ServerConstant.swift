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
}

enum ResponseType {
    case Success
    case Failure
    case ValidationError
    case DuplicationError
}

typealias CompletionHandler = (_ responseType : ResponseType, _ message: String?, _ response: Any?) -> Void

struct ServerConstant {
    
    struct StatusCode {
        static let Continue = 100
        static let ContinueMsg = "Continue"
        static let SwitchingProtocols = 101
        static let SwitchingProtocolsMsg = "Switching Protocols"
        static let OK = 200
        static let Created = 201
        static let CreatedMsg = "Created"
        static let Accepted = 202
        static let AcceptedMsg = "Accepted"
        static let NonAuthoritativeInformation = 203
        static let NonAuthoritativeInformationMsg = "NonAuthoritative Information"
        static let NoContent = 204
        static let NoContentMsg = "No Content"
        static let ResetContent = 205
        static let ResetContentMsg = "Reset Content"
        static let PartialContent = 206
        static let PartialContentMsg = "Partial Content"
        static let MultipleChoices = 300
        static let MultipleChoicesMsg = "Multiple Choices"
        static let MovedPermanently = 301
        static let MovedPermanentlyMsg = "Moved Permanently"
        static let Found = 302
        static let FoundMsg = "Found"
        static let SeeOther = 303
        static let SeeOtherMsg = "See Other"
        static let NotModified = 304
        static let NotModifiedMsg = "Not Modified"
        static let UseProxy = 305
        static let UseProxyMsg = "Use Proxy"
        static let Unused = 306
        static let UnusedMsg = "(Unused)"
        static let TemporaryRedirect = 307
        static let TemporaryRedirectMsg = "Temporary Redirect"
        static let BadRequest = 400
        static let BadRequestMsg = "Bad Request"
        static let Unauthorized = 401
        static let UnauthorizedMsg = "Unauthorized"
        static let PaymentRequired = 402
        static let PaymentRequiredMsg = "Payment Required"
        static let Forbidden = 403
        static let ForbiddenMsg = "Forbidden"
        static let NotFound = 404
        static let NotFoundMsg = "Not Found"
        static let MethodNotAllowed = 405
        static let MethodNotAllowedMsg = "Method Not Allowed"
        static let NotAcceptable = 406
        static let NotAcceptableMsg = "Not Acceptable"
        static let ProxyAuthenticationRequired = 407
        static let ProxyAuthenticationRequiredMsg = "Proxy Authentication Required"
        static let RequestTimeout = 408
        static let RequestTimeoutMsg = "Request Timeout"
        static let Conflict = 409
        static let ConflictMsg = "Conflict"
        static let Gone = 410
        static let GoneMsg = "Gone"
        static let LengthRequired = 411
        static let LengthRequiredMsg = "Length Required"
        static let PreconditionFailed = 412
        static let PreconditionFailedMsg = "Precondition Failed"
        static let RequestEntityTooLarge = 413
        static let RequestEntityTooLargeMsg = "Request Entity Too Large"
        static let RequestURITooLong = 414
        static let RequestURITooLongMsg = "Request-URI Too Long"
        static let UnsupportedMediaType = 415
        static let UnsupportedMediaTypeMsg = "Unsupported Media Type"
        static let RequestedRangeNotSatisfiable = 416
        static let RequestedRangeNotSatisfiableMsg = "Requested Range Not Satisfiable"
        static let ExpectationFailed = 417
        static let ExpectationFailedMsg = "Expectation Failed"
        static let APIValidationFailed = 422
        static let APIValidationFailedMsg = "API Validation Failed"
        static let InternalServerError = 500
        static let InternalServerErrorMsg = "Internal Server Error"
        static let NotImplemented = 501
        static let NotImplementedMsg = "Not Implemented"
        static let BadGateway = 502
        static let BadGatewayMsg = "Bad Gateway"
        static let ServiceUnavailable = 503
        static let ServiceUnavailableMsg = "Service Unavailable"
        static let GatewayTimeout = 504
        static let GatewayTimeoutMsg = "Gateway Timeout"
        static let HTTPVersionNotSupported = 505
        static let HTTPVersionNotSupportedMsg = "HTTP Version Not Supported"
    }
}

func errorMessage(for statusCode: Int) -> String {
    
    switch statusCode {
    case ServerConstant.StatusCode.Accepted:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.AcceptedMsg,statusCode)
    case ServerConstant.StatusCode.BadGateway:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.BadGatewayMsg,statusCode)
    case ServerConstant.StatusCode.BadRequest:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.BadRequestMsg,statusCode)
    case ServerConstant.StatusCode.Conflict:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.ConflictMsg,statusCode)
    case ServerConstant.StatusCode.Continue:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.ContinueMsg,statusCode)
    case ServerConstant.StatusCode.Created:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.CreatedMsg,statusCode)
    case ServerConstant.StatusCode.ExpectationFailed:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.ExpectationFailedMsg,statusCode)
    case ServerConstant.StatusCode.Forbidden:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.ForbiddenMsg,statusCode)
    case ServerConstant.StatusCode.Found:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.FoundMsg,statusCode)
    case ServerConstant.StatusCode.GatewayTimeout:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.GatewayTimeoutMsg,statusCode)
    case ServerConstant.StatusCode.Gone:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.GoneMsg,statusCode)
    case ServerConstant.StatusCode.HTTPVersionNotSupported:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.HTTPVersionNotSupportedMsg,statusCode)
    case ServerConstant.StatusCode.InternalServerError:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.InternalServerErrorMsg,statusCode)
    case ServerConstant.StatusCode.LengthRequired:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.LengthRequiredMsg,statusCode)
    case ServerConstant.StatusCode.MethodNotAllowed:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.MethodNotAllowedMsg,statusCode)
    case ServerConstant.StatusCode.MovedPermanently:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.MovedPermanentlyMsg,statusCode)
    case ServerConstant.StatusCode.MultipleChoices:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.MultipleChoicesMsg,statusCode)
    case ServerConstant.StatusCode.NoContent:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.NoContentMsg,statusCode)
    case ServerConstant.StatusCode.NonAuthoritativeInformation:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.NonAuthoritativeInformationMsg,statusCode)
    case ServerConstant.StatusCode.NotAcceptable:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.NotAcceptableMsg,statusCode)
    case ServerConstant.StatusCode.NotFound:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.NotFoundMsg,statusCode)
    case ServerConstant.StatusCode.NotImplemented:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.NotImplementedMsg,statusCode)
    case ServerConstant.StatusCode.NotModified:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.NotModifiedMsg,statusCode)
    case ServerConstant.StatusCode.PartialContent:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.PartialContentMsg,statusCode)
    case ServerConstant.StatusCode.PaymentRequired:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.PaymentRequiredMsg,statusCode)
    case ServerConstant.StatusCode.PreconditionFailed:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.PreconditionFailedMsg,statusCode)
    case ServerConstant.StatusCode.ProxyAuthenticationRequired:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.ProxyAuthenticationRequiredMsg,statusCode)
    case ServerConstant.StatusCode.RequestedRangeNotSatisfiable:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.RequestedRangeNotSatisfiableMsg,statusCode)
    case ServerConstant.StatusCode.RequestEntityTooLarge:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.RequestEntityTooLargeMsg,statusCode)
    case ServerConstant.StatusCode.RequestTimeout:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.RequestTimeoutMsg,statusCode)
    case ServerConstant.StatusCode.RequestURITooLong:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.RequestURITooLongMsg,statusCode)
    case ServerConstant.StatusCode.ResetContent:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.ResetContentMsg,statusCode)
    case ServerConstant.StatusCode.SeeOther:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.SeeOtherMsg,statusCode)
    case ServerConstant.StatusCode.ServiceUnavailable:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.ServiceUnavailableMsg,statusCode)
    case ServerConstant.StatusCode.SwitchingProtocols:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.SwitchingProtocolsMsg,statusCode)
    case ServerConstant.StatusCode.TemporaryRedirect:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.TemporaryRedirectMsg,statusCode)
    case ServerConstant.StatusCode.Unauthorized:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.UnauthorizedMsg,statusCode)
    case ServerConstant.StatusCode.UnsupportedMediaType:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.UnsupportedMediaTypeMsg,statusCode)
    case ServerConstant.StatusCode.Unused:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.UnusedMsg,statusCode)
    case ServerConstant.StatusCode.UseProxy:
        return String.init(format: "%@ (%d)", ServerConstant.StatusCode.UseProxyMsg,statusCode)
    default:
        return String.init(format: "Something went wrong (%d)", statusCode)
    }
    
}
