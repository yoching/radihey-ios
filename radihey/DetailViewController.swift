//
//  ViewController.swift
//  radihey
//
//  Created by syamaoka on 2017/02/28.
//  Copyright © 2017年 syamaoka. All rights reserved.
//

import UIKit
import Firebase
import ObjectMapper
import AVFoundation

class DetailViewController: UIViewController {

    var firebaseClient: FirebaseClient!
    var channelName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /**
         - SeeAlso: https://gist.github.com/katowulf/6383103
         - Note: コネクションを貼る際に一件だけ取得するように実装しているが、最初繋がった際にもデータを取得してしまうのでフラグ管理。後で直す。
        */
        
        var first = true
        firebaseClient.addReactionObserver(
        of: channelName) { [weak self] reaction in
            if first { first = false; return }
            guard let voiceType = reaction.voiceType else { return }
            self?.playSound(voiceType: voiceType)
        }
    }
    
    /**
     - SeeAlse: http://xyk.hatenablog.com/entry/2017/02/19/002743
    */
    func playSound(voiceType: VoiceStamp) {
        let url = voiceType.getSound()
        var soundID: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(url as CFURL, &soundID)
        AudioServicesAddSystemSoundCompletion(soundID, nil, nil, { (soundID, _) in
            AudioServicesDisposeSystemSoundID(soundID)
        }, nil)
        AudioServicesPlaySystemSound(soundID)
    }
    
    @IBAction func tappedLikeButton(_ sender: UIButton) {
        firebaseClient.send(reaction: .maleA(.iine), to: channelName)
    }
    
    @IBAction func tappedGodButton(_ sender: UIButton) {
        firebaseClient.send(reaction: .maleA(.kami), to: channelName)
    }
}
