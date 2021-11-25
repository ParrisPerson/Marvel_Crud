//
//  GlobalTotalList.swift
//  Lendu
//
//   
//

import Foundation
import ObjectMapper

class GlobalTotalList<T: Decodable>: Decodable {
    var list: [T]?
    var errors: [GlobalError<String>]?
    var totalCount: Int?
    var sections: Dictionary<String, Int>?

    required init?(map: Map){

    }

    func mapping(map: Map) {
        list        <-  map["list"]
        totalCount  <-  map["totalCount"]
        errors        <-  map["errors"]
        sections    <- map["sections"]
    }
}
