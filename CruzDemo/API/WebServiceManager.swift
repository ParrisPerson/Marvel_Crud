//
//  WebServiceManager.swift
//   
//
 
//

import Foundation
import Alamofire

class WebServiceManager: NSObject {
    
    static let shared = WebServiceManager()
    
    func initManager() -> Alamofire.SessionManager {
        
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = TimeInterval(60)
        configuration.timeoutIntervalForRequest = TimeInterval(60)

        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        sessionManager.adapter = RequestInterceptor()
        return sessionManager
    }
    
    func isValid<T>(content: GlobalResponse<T>) -> Bool {
        return content.errors == nil
    }
}
