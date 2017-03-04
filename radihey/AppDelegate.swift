//
//  AppDelegate.swift
//  radihey
//
//  Created by syamaoka on 2017/02/28.
//  Copyright © 2017年 syamaoka. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    override init() {
        super.init()
        FIRApp.configure()
    }
}

