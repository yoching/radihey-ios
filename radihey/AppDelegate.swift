//
//  AppDelegate.swift
//  radihey
//
//  Created by syamaoka on 2017/02/28.
//  Copyright © 2017年 syamaoka. All rights reserved.
//

import UIKit
import Firebase
struct Const {
    static let VoiceType = "VoiceType"
}
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UINavigationBar.appearance().tintColor = UIColor.white
        application.statusBarStyle = UIStatusBarStyle.lightContent
        UserDefaults.standard.set(arc4random() % 2, forKey: Const.VoiceType)
        UserDefaults.standard.synchronize()
        
        return true
    }
    
    override init() {
        super.init()
        FIRApp.configure()
    }
}

