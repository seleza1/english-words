//
//  SceneDelegate.swift
//  english-words
//
//  Created by user on 12.04.2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        let navigationController = UINavigationController(rootViewController: MainTabBarController())
        navigationController.isNavigationBarHidden = true
        window?.rootViewController = navigationController
    }
}
