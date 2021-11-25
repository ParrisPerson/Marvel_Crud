 

import Foundation
import UIKit
import ObjectMapper
import Alamofire

open class WSUtils: NSObject {
    
    static let sharedInstance = WSUtils()
    
    func wsInit() -> Alamofire.SessionManager {
        
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
