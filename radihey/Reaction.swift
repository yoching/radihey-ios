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
    var voiceType: VoiceStamp?
    var date: Int!
    
    required init?(map Map: Map){
        // チェック
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        date <- map["date"]

        if let voice = map["voiceType"].currentValue as? Int,
            let reaction = map["reactionId"].currentValue as? Int {
          voiceType = VoiceStamp(reactionId: reaction, voiceType: voice)
        }
    }
}
