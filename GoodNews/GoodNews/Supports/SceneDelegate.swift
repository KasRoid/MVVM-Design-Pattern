//
//  SceneDelegate.swift
//  GoodNews
//
//  Created by Kas Song on 2/11/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        initializeWindow(windowScene: windowScene)
    }
    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}

extension SceneDelegate {
    final private func initializeWindow(windowScene: UIWindowScene) {
        window = UIWindow(windowScene: windowScene)
        let rootVC = NewsListTableViewController()
        let naviVC = UINavigationController(rootViewController: rootVC)
        window?.rootViewController = naviVC
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
}
