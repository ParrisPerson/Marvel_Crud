//
//  Response.swift
//  MarvelCrud
//
//  Created by Parris Person on 25/11/21.
//

import Foundation
import ObjectMapper

class Response: Mappable, Decodable {
   
   
    var code : Int?
    var status : String?
    var copyright : String?
    var attributionText : String?
    var attributionHTML : String?
    var etag : String?
    var data : SuperResponse?
    
   required init?(map: Map) {}
   
   // Mappable
   func mapping(map: Map) {
       code           <- map["code"]
       status           <- map["status"]
       copyright           <- map["copyright"]
       attributionText           <- map["attributionText"]
       attributionHTML           <- map["attributionHTML"]
       etag           <- map["etag"]
       data           <- map["data"]

   }
   
}
