 

import Foundation
import UIKit
import Alamofire
import AlamofireMapper
import ObjectMapper

open class UserDataManager: NSObject {

   static let sharedInstance = UserDataManager()
   
   var sessionManager: Alamofire.SessionManager?
   
 
   
   override public init() {
       //Make the request
        sessionManager = WSUtils.sharedInstance.wsInit()
   }

     
}
   
