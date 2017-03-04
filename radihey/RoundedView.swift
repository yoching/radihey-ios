//
//  RoundedView.swift
//  radihey
//
//  Created by Yoshikuni Kato on 3/4/17.
//  Copyright © 2017 syamaoka. All rights reserved.
//

import UIKit

@IBDesignable class RoundedView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = cornerRadius > 0.0
        }
    }
}
