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
    case maleB(Message)
    case femaleB(Message)
    case maleC(Message)
    case femaleC(Message)
    
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
        case 2:
            guard let voice = Message(rawValue: reactionId).flatMap(VoiceStamp.maleB) else {
                return nil
            }
            self = voice
        case 3:
            guard let voice = Message(rawValue: reactionId).flatMap(VoiceStamp.femaleB) else {
                return nil
            }
            self = voice
        case 4:
            guard let voice = Message(rawValue: reactionId).flatMap(VoiceStamp.maleC) else {
                return nil
            }
            self = voice
        case 5:
            guard let voice = Message(rawValue: reactionId).flatMap(VoiceStamp.femaleC) else {
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
        case .maleB(let reaction):
            return Bundle.main.url(forResource: reaction.fileName, withExtension: "wav", subdirectory: "SE/MB")!
        case .femaleB(let reaction):
            return Bundle.main.url(forResource: reaction.fileName, withExtension: "wav", subdirectory: "SE/FB")!
        case .maleC(let reaction):
            return Bundle.main.url(forResource: reaction.fileName, withExtension: "wav", subdirectory: "SE/MC")!
        case .femaleC(let reaction):
            return Bundle.main.url(forResource: reaction.fileName, withExtension: "wav", subdirectory: "SE/FC")!
        }
    }

    func getTitle() -> String {
        switch self {
        case .maleA(let reaction):
            return reaction.text
        case .femaleA(let reaction):
            return reaction.text
        case .maleB(let reaction):
            return reaction.text
        case .femaleB(let reaction):
            return reaction.text
        case .maleC(let reaction):
            return reaction.text
        case .femaleC(let reaction):
            return reaction.text
        }
    }
    
    var parametersForFirebase: [String: Any] {
        switch self {
        case .maleA(let reaction):
            return ["reactionId": reaction.rawValue, "voiceType": 0]
        case .femaleA(let reaction):
            return ["reactionId": reaction.rawValue, "voiceType": 1]
        case .maleB(let reaction):
            return ["reactionId": reaction.rawValue, "voiceType": 2]
        case .femaleB(let reaction):
            return ["reactionId": reaction.rawValue, "voiceType": 3]
        case .maleC(let reaction):
            return ["reactionId": reaction.rawValue, "voiceType": 4]
        case .femaleC(let reaction):
            return ["reactionId": reaction.rawValue, "voiceType": 5]
        }
    }
    
    var message: Message {
        switch self {
        case let .maleA(_message):
            return _message
        case let .femaleA(_message):
            return _message
        case let .maleB(_message):
            return _message
        case let .femaleB(_message):
            return _message
        case let .maleC(_message):
            return _message
        case let .femaleC(_message):
            return _message
        }
    }
}
