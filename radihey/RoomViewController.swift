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
    @IBOutlet weak var radiheyImage: UIImageView!
    
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
        
        setUpNavigationBar()
    }
    
    private func setUpNavigationBar() {
        let navigationTitleFont = UIFont(name: "KFhimaji", size: 24)!
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: navigationTitleFont,
            NSForegroundColorAttributeName: UIColor.white
        ]
        self.navigationItem.title = channelName
    }
    
    func addReactionAnimation(message: Message) {
        
        func animateLabel() {
            let label = UILabel(frame: CGRect(x: 180, y: 278, width: 50, height: 50))
            label.font = UIFont(name: "KFhimaji", size: 70.0)
            label.text = message.text
            label.sizeToFit()
            label.shadowColor = UIColor(rgb: 0x000000, alpha: 0.3)
            label.shadowOffset = CGSize(width: 2.0, height: 2.0)
            view.addSubview(label)
            
            let timing = UICubicTimingParameters(controlPoint1: CGPoint(x: 0.19, y: 0.59), controlPoint2: CGPoint(x: 0.7, y: 1.0))
            let animator = UIViewPropertyAnimator(duration: 2.0, timingParameters: timing)
            animator.addAnimations {
                label.frame.origin = CGPoint(x: -20.0, y: 20.0)
                label.alpha = 0.0
            }
            
            animator.startAnimation()
        }
        
        func animateRadihey() {
            UIView.animateKeyframes(
                withDuration: 0.5,
                delay: 0.0,
                options: .calculationModeCubic,
                animations: { 
                    UIView.addKeyframe(
                        withRelativeStartTime: 0,
                        relativeDuration: 0.1,
                        animations: {
                            self.radiheyImage.transform = CGAffineTransform(translationX: -10.0, y: -10.0)
                    })
                    UIView.addKeyframe(
                        withRelativeStartTime: 0.1,
                        relativeDuration: 0.8,
                        animations: {
                            self.radiheyImage.transform = .identity
                    })
            },
                completion: nil
            )
        }
        
        animateLabel()
        animateRadihey()
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
