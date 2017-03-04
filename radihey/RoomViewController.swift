//
//  RoomViewController.swift
//  radihey
//
//  Created by Yoshikuni Kato on 3/4/17.
//  Copyright © 2017 syamaoka. All rights reserved.
//

import UIKit

final class RoomViewController: UIViewController {
    
    @IBOutlet weak var buttonsBackgroundView: UIView!
    
    let cellModels: [ReactionButtonCellModel] = [
        ReactionButtonCellModel(title: "なるほど"),
        ReactionButtonCellModel(title: "へぇ"),
        ReactionButtonCellModel(title: "いいね"),
        ReactionButtonCellModel(title: "なるほど"),
        ReactionButtonCellModel(title: "へぇ"),
        ReactionButtonCellModel(title: "いいね"),
        ReactionButtonCellModel(title: "なるほど"),
        ReactionButtonCellModel(title: "へぇ"),
        ReactionButtonCellModel(title: "いいね"),
        ReactionButtonCellModel(title: "なるほど"),
        ReactionButtonCellModel(title: "へぇ"),
        ReactionButtonCellModel(title: "いいね"),
        ReactionButtonCellModel(title: "なるほど"),
        ReactionButtonCellModel(title: "へぇ"),
        ReactionButtonCellModel(title: "いいね"),
        ReactionButtonCellModel(title: "なるほど"),
        ReactionButtonCellModel(title: "へぇ"),
        ReactionButtonCellModel(title: "いいね"),
    ]
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsBackgroundView.layer.shadowColor = UIColor(rgb: 0x432A17).cgColor
        buttonsBackgroundView.layer.shadowOpacity = 0.5
        buttonsBackgroundView.layer.shadowOffset = CGSize(width: 0.0, height: -1.0)
    }
}

extension RoomViewController: StoryboardInstantiatable {}

extension RoomViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithType(ReactionButtonCell.self, forIndexPath: indexPath)
        cell.configure(with: cellModels[indexPath.item])
        return cell
    }
}

extension RoomViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
