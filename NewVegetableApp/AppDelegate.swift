//
//  AppDelegate.swift
//  NewVegetableApp
//
//  Created by Monish Chopra on 31/05/20.
//  Copyright © 2020 Monish Chopra. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Use Firebase library to configure APIs
        
        //check window obj
        if #available(iOS 13.0, *){
            let scene = UIApplication.shared.connectedScenes.first
            if let sd: SceneDelegate = (scene?.delegate as? SceneDelegate){
                self.window = sd.window
            }
        }
        else{
            self.window = UIWindow(frame: UIScreen.main.bounds)
        }
        
        
        navigate()
        FirebaseApp.configure()
        

   
        return true
    }

    func navigate(){
        if  UserDefaults.standard.bool(forKey: "login")
           {
                    
               let storyboard :UIStoryboard =  UIStoryboard(name: "Main", bundle: nil)
               let mapViewControllerObj = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
               let navController  = UINavigationController(rootViewController: mapViewControllerObj!)
               self.window?.rootViewController = navController
               }
               
           else{
              
           
           let storyboard :UIStoryboard =  UIStoryboard(name: "Main", bundle: nil)
           let mapViewControllerObj = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
           let navController  = UINavigationController(rootViewController: mapViewControllerObj!)
           self.window?.rootViewController = navController
           
              }
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

