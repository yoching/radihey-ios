//
//  Reaction.swift
//  radihey
//
//  Created by syamaoka on 2017/03/04.
//  Copyright © 2017年 syamaoka. All rights reserved.
//

import UIKit
import ObjectMapper

class Reaction: Mappable {
    var id: String!
    var reactionId: Int!
    var date: Int!
    
    required init?(map Map: Map){
        // チェック
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        reactionId <- map["reactionId"]
        date <- map["date"]
    }
}
