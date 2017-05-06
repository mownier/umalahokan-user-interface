//
//  AppDelegate.swift
//  UserInterface
//
//  Created by Mounir Ybanez on 06/05/2017.
//  Copyright © 2017 Ner. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var module: LoginModule!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FIRApp.configure()
        module = LoginModule.create()
        window?.rootViewController = module.scene as! LoginViewController
        return true
    }
}

