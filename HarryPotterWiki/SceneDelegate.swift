//
//  SceneDelegate.swift
//  HarryPotterWiki
//
//  Created by Pei-Tzu Huang on 2024/9/18.
//

import UIKit

/// Before the ipad has the ability to open two windows, app delegate becomes scene delegate.

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    /// This code launchs the app to the first screen without storyboard
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
     
        guard let windowScene = (scene as? UIWindowScene) else { return }
                
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = UINavigationController(rootViewController: WizardListVC())
        window?.makeKeyAndVisible()
        
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
   
    }


}

