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
        let builder = SceneBuilder()
        let router = Router(builder: builder)
        let view = ScreenThinksHumanViewController()
        view.presenter = ScreenThinksHumanPresenter(view: view, router: router)
        window?.rootViewController = view
        window?.makeKeyAndVisible()
        
        
//        let view = ScreenThinksHumanViewController()
//        let gameModel = GameModel()
//        view.presenter = ScreenThinksHumanPresenter(view: view, model: gameModel)
//        window?.rootViewController = view
//        window?.makeKeyAndVisible()
    }
}

