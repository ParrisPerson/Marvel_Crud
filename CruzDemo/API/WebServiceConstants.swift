//
//  WebServiceConstants.swift
//   
//
//   
//

import Foundation

struct WebServiceConstants {
    
    struct Headers {
        static let headerName = "X-Auth-Token"
        static let cookieName = "Cookie"
        static let cookieValue = " "
    }
    
    struct Super {
        
        static let get = "https://gateway.marvel.com:443/v1/public/characters"
        static let getOne = "https://gateway.marvel.com:443/v1/public/characters/%d?apikey=539241bbe488328ea54015bcfaac663f"
 
    }
 
    enum ErrorTypes {
        case ErrorTypeGenericError
        case ErrorTypeUserUnauthorized
    }
    
    enum UserStates: Int {
        case userStateNotFound = 0
        case userStateActive = 1
        case userStateInactive = 2
        case userStateBlocked = 3
        case userStateError = -1
    }
}
