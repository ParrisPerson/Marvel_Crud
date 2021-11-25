//
//  SuperRemoteDataManager.swift
//  MarvelCrud
//
//  Created by Parris Person on 25/11/21.
//

import Foundation
import UIKit
import Alamofire
import AlamofireMapper
import ObjectMapper
import Gloss
import CryptoSwift

struct KeyDict {
    let publicKey: String!
    let privateKey: String!
}

open class SuperRemoteDataManager: NSObject {
    private var keys: NSDictionary?

    static let sharedInstance = SuperRemoteDataManager()
    
    var sessionManager: Alamofire.SessionManager?
    
    
    override public init() {
        //Make the request
        sessionManager = WSUtils.sharedInstance.wsInit()
    }
    
    func getKeys() -> KeyDict {
           if let path = Bundle.main.path(forResource: "apikeys", ofType: "plist") {
               self.keys = NSDictionary(contentsOfFile: path)!
           }
           
           if let data = keys {
               return KeyDict(publicKey: data["publicKey"] as! String, privateKey: data["privateKey"] as! String)
           } else {
               return KeyDict(publicKey: "", privateKey: "")
           }
       }
    
    func getAll(_ onSuccess: @escaping ((_ response: GlobalResponse<SuperResponse>) -> Void), onError: @escaping ((_ error: GlobalResponse<SuperResponse>) -> Void)) {
   
        let dict: KeyDict = self.getKeys()
        let ts = NSDate().timeIntervalSince1970.description
        let params: Parameters = [
                    "apikey": dict.publicKey!,
                    "ts": ts,
                    "hash": (ts + dict.privateKey! + dict.publicKey!).md5(),
                ]
        
        sessionManager!.request(WebServiceConstants.Super.get, method: .get, parameters: params, headers: nil).responseObject { (response: DataResponse<GlobalResponse<SuperResponse>>) in
            if response.result.isSuccess {
                if let wsResponse: GlobalResponse<SuperResponse> = response.result.value {
                    if WSUtils.sharedInstance.isValid(content: wsResponse) { onSuccess(wsResponse) } else { onError(wsResponse) }
                } else {
                    onError(GlobalResponse<SuperResponse>.init())
                }
            }
            else {
                onError(GlobalResponse<SuperResponse>.init())
            }
        }
    }
    
}
