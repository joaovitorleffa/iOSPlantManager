//
//  AppDelegate.swift
//  iOSPlantManager
//
//  Created by joaovitor on 15/02/22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let firstScreen = GreetingViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: firstScreen)
        //window?.rootViewController = UserIdentificationViewController()
        //window?.rootViewController = ConfirmationViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}

