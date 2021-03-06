//
//  CollectionView+Type.swift
//  radihey
//
//  Created by Yoshikuni Kato on 3/4/17.
//  Copyright © 2017 syamaoka. All rights reserved.
//

import UIKit

extension UICollectionView {
    func registerNibForCellWithType<T: UICollectionViewCell>(_ type: T.Type) {
        let className = String(describing: T.self)
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellWithReuseIdentifier: className)
    }
    
    func registerClassForCellWithType<T: UICollectionViewCell>(_ type: T.Type) {
        let className = String(describing: T.self)
        register(T.self, forCellWithReuseIdentifier: className)
    }
    
    func dequeueReusableCellWithType<T: UICollectionViewCell>(
        _ type: T.Type,
        forIndexPath indexPath: IndexPath) -> T {
        return dequeueReusableCell(
            withReuseIdentifier: String(describing: T.self),
            for: indexPath) as! T // swiftlint:disable:this force_cast
    }
}
