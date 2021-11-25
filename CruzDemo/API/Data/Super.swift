//
//  Super.swift
//  MarvelCrud
//
//  Created by Parris Person on 25/11/21.
//

import Foundation
import ObjectMapper

class Super: Mappable, Decodable {
   
   
    var id : Int?
    var name : String?
    var description : String?
    var thumbnail : Thumbnail?
     
   
   required init?(map: Map) {}
   
   // Mappable
   func mapping(map: Map) {
       id           <- map["id"]
       name           <- map["name"]
       description           <- map["description"]
       thumbnail           <- map["thumbnail"]
   }
   
}
