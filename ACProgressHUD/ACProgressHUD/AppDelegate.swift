//
//  AppDelegate.swift
//  ACProgressHUD
//
//  Created by Er Abhishek Chandani on 18/03/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Configure the Progress HUD one time for using in App.
        ACProgressHUD.shared.configureProgressHudStyle(withProgressText: "Hey Please wait...",hudBackgroundColor: UIColor.white, shadowColor: UIColor.black, shadowRadius: 10, cornerRadius: 5, indicatorColor: UIColor.orange, enableBackground: false, backgroundColor: UIColor.black, backgroundColorAlpha: 0.3, enableBlurBackground: false,showHudAnimation: .growIn,dismissHudAnimation: .growOut)
        return true
    }


}

