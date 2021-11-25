//
//  RequestInterceptor.swift
//  Lendu
//
//   
//

import Foundation
import Alamofire

class RequestInterceptor: RequestAdapter {
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlReq = urlRequest
 
        if Environment.currentEnviroment != String.productionEnv {
            urlReq.setValue(WebServiceConstants.Headers.cookieValue, forHTTPHeaderField: WebServiceConstants.Headers.cookieName)
        }
        
        return urlReq
    }
}
