//
//  AppDelegate.swift
//  Simon
//
//  Created by Joseph Ellegood on 2/8/16.
//  Copyright © 2016 Joseph Ellegood. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let simonColorGenerator = RandomSimonNumberGenerator()
        let simonModel = SimonModel(simonNumberGenerator: simonColorGenerator)
        
        
        window?.rootViewController = MainScreenViewController(simonModel: simonModel)
        window?.makeKeyAndVisible()
        return true
    }
}

