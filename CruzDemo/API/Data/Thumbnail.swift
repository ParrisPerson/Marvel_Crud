//
//  Thumbnail.swift
//  MarvelCrud
//
//  Created by Parris Person on 25/11/21.
//

import Foundation
import ObjectMapper

class Thumbnail: Mappable, Decodable {
   
   
    var path : String?
    var `extension` : String? // ;)
     
     
   
   required init?(map: Map) {}
   
   // Mappable
   func mapping(map: Map) {
       path           <- map["path"]
       `extension`           <- map["extension"]
   }
   
}
