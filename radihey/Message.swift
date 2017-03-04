//
//  Message.swift
//  radihey
//
//  Created by syamaoka on 2017/03/04.
//  Copyright © 2017年 syamaoka. All rights reserved.
//

enum Message:Int {
    case deta
    case ee
    case hee
    case huun
    case iine
    case kami
    case kora
    case majide
    case muzukashii
    case nande
    case naruhodo
    case oh
    case omoshiroi
    case shiritai
    case sugoi
    case tashikani
    case umaina
    case un
    case warai
    case yabai
    case yarareta

    var fileName: String {
        switch self {
        case .deta:
            return "deta"
        case .ee:
            return "ee"
        case .hee:
            return "hee"
        case .huun:
            return "huun"
        case .iine:
            return "iine"
        case .kami:
            return "kami"
        case .kora:
            return "kora"
        case .majide:
            return "majide"
        case .muzukashii:
            return "muzukashii"
        case .nande:
            return "nande"
        case .naruhodo:
            return "naruhodo"
        case .oh:
            return "oh"
        case .omoshiroi:
            return "omoshioi"
        case .shiritai:
            return "shiritai"
        case .sugoi:
            return "sugoi"
        case .tashikani:
            return "tashikani"
        case .umaina:
            return "umaina"
        case .un:
            return "un"
        case .warai:
            return "warai"
        case .yabai:
            return "yabai"
        case .yarareta:
            return "yarareta"
        }
    }

    var text: String {
        switch self {
        case .deta:
            return "でた"
        case .ee:
            return "えー"
        case .hee:
            return "へぇ"
        case .huun:
            return "ふーん"
        case .iine:
            return "いいね"
        case .kami:
            return "かみ"
        case .kora:
            return "こら"
        case .majide:
            return "まじで"
        case .muzukashii:
            return "むずかしい"
        case .nande:
            return "なんで"
        case .naruhodo:
            return "なるほど"
        case .oh:
            return "おー"
        case .omoshiroi:
            return "おもしろい"
        case .shiritai:
            return "しりたい"
        case .sugoi:
            return "すごい"
        case .tashikani:
            return "たしかに"
        case .umaina:
            return "うまいな"
        case .un:
            return "うん"
        case .warai:
            return "（笑）"
        case .yabai:
            return "やばい"
        case .yarareta:
            return "やられた"
        }
    }
}
