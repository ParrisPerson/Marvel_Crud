//
//  GlobalResponse.swift
//   
//
//   
//

import Foundation
import ObjectMapper

class GlobalResponse<T: Decodable> : Decodable {
    var data: T?
    var errors: [GlobalError<String>]?

    required init?(map: Map){}
    
    init() {
        data = nil
        let genericErrorData = ["data": "0", "code": "errorCode", "field": "errorField"] as [String: Any]
        let myMap: Map = Map.init(mappingType: .fromJSON, JSON: genericErrorData, shouldIncludeNilValues: true)
        let error = GlobalError<String>.init(map: myMap)
        errors = [error!]
    }

    func mapping(map: Map) {
       
    }
}
