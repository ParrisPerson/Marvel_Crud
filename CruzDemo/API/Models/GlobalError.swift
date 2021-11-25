//
//  GlobalError.swift
//   
//
//   
//

import Foundation
import ObjectMapper

class GlobalError<T: Decodable>: Decodable {
    var data: String?
    var code: String?
    var field: String?

    required init?(map: Map){

    }

    func mapping(map: Map) {
        data    <-  map["data"]
        code    <-  map["code"]
        field   <-  map["field"]
    }
}
