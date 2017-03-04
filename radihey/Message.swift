//
//  Message.swift
//  radihey
//
//  Created by syamaoka on 2017/03/04.
//  Copyright © 2017年 syamaoka. All rights reserved.
//

enum Message:Int {
    case iine
    case hee
    case naruhodo
    case oh
    case yabai
    case kami
    
    var filePrefix: String {
        switch self {
        case .iine:
            return "iine"
        case .hee:
            return "hee"
        case .naruhodo:
            return "naruhodo"
        case .oh:
            return "oh"
        case .yabai:
            return "yabai"
        case .kami:
            return "kami"
        }
    }
}
