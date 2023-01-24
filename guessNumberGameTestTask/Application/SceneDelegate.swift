//
//  SceneDelegate.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 22.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let builder = ScreenBuilder()
        let navigationController = UINavigationController()
        let router = Router(navigationController: navigationController, builder: builder)
        router.initialViewController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

