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
    let ref = FIRDatabase.database().reference().child("channels")
    var channelName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /**
         - SeeAlso: https://gist.github.com/katowulf/6383103
         - Note: コネクションを貼る際に一件だけ取得するように実装しているが、最初繋がった際にもデータを取得してしまうのでフラグ管理。後で直す。
        */
        var first = true
        self.ref.child(channelName).queryLimited(toLast: 1).observe(.childAdded, with: { (snapshot) in
            if first { first = false; return }
            guard let reaction = Mapper<Reaction>().map(snapshot: snapshot) else { return }
            
            guard let voiceType = reaction.voiceType else { return }
            self.playSound(voiceType: voiceType)
        })
    }
    
    /**
     - SeeAlse: http://xyk.hatenablog.com/entry/2017/02/19/002743
    */
    func playSound(voiceType: VoiceType) {
        let url = voiceType.getSound()
        var soundID: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(url as CFURL, &soundID)
        AudioServicesAddSystemSoundCompletion(soundID, nil, nil, { (soundID, _) in
            AudioServicesDisposeSystemSoundID(soundID)
        }, nil)
        AudioServicesPlaySystemSound(soundID)
    }
    
    @IBAction func tappedLikeButton(_ sender: UIButton) {
        self.ref.child(channelName).childByAutoId().setValue(["reactionId": 0, "voiceType": 0, "date": FIRServerValue.timestamp()])
        
        let viewController = RoomViewController.instantiate()
        present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func tappedGodButton(_ sender: UIButton) {
        self.ref.child(channelName).childByAutoId().setValue(["reactionId": 1, "voiceType": 1, "date": FIRServerValue.timestamp()])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
