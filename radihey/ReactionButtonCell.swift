//
//  ReactionButtonCell.swift
//  radihey
//
//  Created by Yoshikuni Kato on 3/4/17.
//  Copyright © 2017 syamaoka. All rights reserved.
//

import UIKit

final class ReactionButtonCell: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var roundedView: RoundedView!
    
    func configure(with voiceStamp: VoiceStamp) {
        name.text = voiceStamp.getTitle()
    }
 
    func setSelected(selected: Bool) {
        
    }
}

