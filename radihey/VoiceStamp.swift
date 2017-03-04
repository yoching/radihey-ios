//
//  VoiceStamp.swift
//  radihey
//
//  Created by syamaoka on 2017/03/04.
//  Copyright © 2017年 syamaoka. All rights reserved.
//

import UIKit

enum VoiceStamp {
    case maleA(Message)
    case femaleA(Message)
    
    init?(reactionId: Int, voiceType: Int) {
        switch voiceType {
        case 0:
            guard let voice = Message(rawValue: reactionId).flatMap(VoiceStamp.maleA) else {
                return nil
            }
            self = voice
        case 1:
            guard let voice = Message(rawValue: reactionId).flatMap(VoiceStamp.femaleA) else {
                return nil
            }
            self = voice
        default:
            return nil
        }
    }
    
    func getSound() -> URL {
        switch self {
        case .maleA(let reaction):
            return Bundle.main.url(forResource: reaction.fileName, withExtension: "wav", subdirectory: "SE/MA")!
        case .femaleA(let reaction):
            return Bundle.main.url(forResource: reaction.fileName, withExtension: "wav", subdirectory: "SE/FA")!
        }
    }
    
    func getTitle() -> String {
        switch self {
        case .maleA(let reaction):
            return reaction.text
        case .femaleA(let reaction):
            return reaction.text
        }
    }
    
    var parametersForFirebase: [String: Any] {
        switch self {
        case .maleA(let reaction):
            return ["reactionId": reaction.rawValue, "voiceType": 0]
        case .femaleA(let reaction):
            return ["reactionId": reaction.rawValue, "voiceType": 1]
            
        }
    }
    
    var message: Message {
        switch self {
        case let .maleA(_message):
            return _message
        case let .femaleA(_message):
            return _message
        }
    }
}
