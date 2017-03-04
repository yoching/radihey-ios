//
//  VoiceType.swift
//  radihey
//
//  Created by syamaoka on 2017/03/04.
//  Copyright © 2017年 syamaoka. All rights reserved.
//

import UIKit

enum VoiceType {
    case maleA(ReactionType)
    case femaleA(ReactionType)
    
    init?(reactionId: Int, voiceType: Int) {
        switch voiceType {
        case 0:
            guard let voice = ReactionType(rawValue: reactionId).flatMap(VoiceType.maleA) else {
                return nil
            }
            self = voice
        case 1:
            guard let voice = ReactionType(rawValue: reactionId).flatMap(VoiceType.femaleA) else {
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
            return Bundle.main.url(forResource: reaction.filePrefix, withExtension: "wav", subdirectory: "SE/MA")!
        case .femaleA(let reaction):
            return Bundle.main.url(forResource: reaction.filePrefix, withExtension: "wav", subdirectory: "SE/FA")!
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
}
