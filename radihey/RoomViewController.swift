//
//  RoomViewController.swift
//  radihey
//
//  Created by Yoshikuni Kato on 3/4/17.
//  Copyright © 2017 syamaoka. All rights reserved.
//

import UIKit
import AVFoundation

final class RoomViewController: UIViewController {
    
    var firebaseClient: FirebaseClient!
    var channelName: String!
    
    @IBOutlet weak var buttonsBackgroundView: UIView!
    
    let voiceStamps: [VoiceStamp] = [
        VoiceStamp(reactionId: Message.naruhodo.rawValue, voiceType: 0)!,
        VoiceStamp(reactionId: Message.hee.rawValue, voiceType: 0)!,
        VoiceStamp(reactionId: Message.iine.rawValue, voiceType: 0)!,
        VoiceStamp(reactionId: Message.yabai.rawValue, voiceType: 0)!,
        VoiceStamp(reactionId: Message.oh.rawValue, voiceType: 0)!,
        VoiceStamp(reactionId: Message.kami.rawValue, voiceType: 0)!,
    ]

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
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsBackgroundView.layer.shadowColor = UIColor(rgb: 0x432A17).cgColor
        buttonsBackgroundView.layer.shadowOpacity = 0.5
        buttonsBackgroundView.layer.shadowOffset = CGSize(width: 0.0, height: -1.0)
        
        var first = true
        firebaseClient.addReactionObserver(
        of: channelName) { [weak self] reaction in
            if first { first = false; return }
            guard let voiceType = reaction.voiceType else { return }
            self?.playSound(voiceType: voiceType)
        }
    }
}

extension RoomViewController: StoryboardInstantiatable {}

extension RoomViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return voiceStamps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithType(ReactionButtonCell.self, forIndexPath: indexPath)
        cell.configure(with: voiceStamps[indexPath.item])
        return cell
    }
}

extension RoomViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        firebaseClient.send(reaction: voiceStamps[indexPath.item], to: channelName)
    }
}
