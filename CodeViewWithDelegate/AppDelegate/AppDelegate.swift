//
//  AppDelegate.swift
//  CodeViewWithDelegate
//
//  Created by Marcello Chuahy on 17/12/19.
//  Copyright © 2019 Applause Codes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let controller = ViewController()
        
        window.rootViewController = controller
        self.window = window
        window.makeKeyAndVisible()
        
        return true
        
    }
    
}
