//
//  ReactionType.swift
//  radihey
//
//  Created by syamaoka on 2017/03/04.
//  Copyright © 2017年 syamaoka. All rights reserved.
//

enum ReactionType:Int {
    case like
    case god
    
    var filePrefix: String {
        switch self {
        case .like:
            return "iine"
        case .god:
            return "kami"
        }
    }

}
