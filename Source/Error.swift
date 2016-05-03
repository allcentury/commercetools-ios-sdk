//
// Copyright (c) 2016 Commercetools. All rights reserved.
//

import Foundation

/// The `Error` struct provides a convenience for creating custom Commercetools SDK NSErrors.
public struct Error {

    /// The domain used for creating all Commercetools errors.
    public static let Domain = "com.commercetools.error"

    /// The custom error codes generated by Commercetools.
    public enum Code: Int {
        case ConfigurationValidationFailed       = -7000
        case AccessTokenRetrievalFailed          = -7001
        case InvalidJsonInputError               = -7002
        case ResourceNotFoundError               = -7003
        case ConcurrentModificationError         = -7004
        case InsufficientTokenGrantTypeError     = -7005
        case GeneralCommercetoolsError           = -7099

        init(code: String) {
            switch code {
            case "ConfigurationValidationFailed":
                self = .ConfigurationValidationFailed
            case "AccessTokenRetrievalFailed":
                self = .AccessTokenRetrievalFailed
            case "InvalidJsonInput":
                self = .InvalidJsonInputError
            case "ResourceNotFound":
                self = .ResourceNotFoundError
            case "ConcurrentModification":
                self = .ConcurrentModificationError
            case "insufficient_token_grant_type":
                self = .InsufficientTokenGrantTypeError
            default:
                self = .GeneralCommercetoolsError
            }
        }
    }

    static func error(domain domain: String = Error.Domain, code: Code, failureReason: String? = nil, description: String? = nil) -> NSError {
        return error(domain: domain, code: code.rawValue, failureReason: failureReason ?? "Unknown", description: description)
    }

    static func error(domain domain: String = Error.Domain, code: Int, failureReason: String, description: String? = nil) -> NSError {
        var userInfo = [NSLocalizedFailureReasonErrorKey: failureReason]
        if let description = description {
            userInfo[NSLocalizedDescriptionKey] = description
        }
        return NSError(domain: domain, code: code, userInfo: userInfo)
    }
}
