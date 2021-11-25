//
//  SuperResponse.swift
//  MarvelCrud
//
//  Created by Parris Person on 25/11/21.
//

import Foundation
import ObjectMapper

class SuperResponse: Mappable, Decodable {
   
   
    var offset : Int?
    var limit : Int?
    var total : Int?
    var count : Int?
    var results : [Super]?
   
   required init?(map: Map) {}
   
   // Mappable
   func mapping(map: Map) {
       offset           <- map["offset"]
       limit           <- map["limit"]
       total           <- map["total"]
       count           <- map["count"]
       results           <- map["results"]

   }
   
}
