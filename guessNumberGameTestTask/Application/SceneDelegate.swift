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
        let view = ScreenStartGameVC()
        let router = Router(viewController: view, builder: builder)
        view.presenter = ScreenStartGamePresenter(view: view, router: router)
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}

