//
//  StoryboardInstantiatable.swift
//  radihey
//
//  Created by Yoshikuni Kato on 3/4/17.
//  Copyright © 2017 syamaoka. All rights reserved.
//

import UIKit

protocol StoryboardInstantiatable {}

extension StoryboardInstantiatable {
    static func instantiate() -> Self {
        let storyBoard = UIStoryboard(name: String(describing: Self.self), bundle: nil)
        return storyBoard.instantiateInitialViewController() as! Self // swiftlint:disable:this force_cast
    }
}
