//
//  Router.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 23.01.2023.
//

import UIKit


protocol RouterMainProtocol: AnyObject {
    var navigationController: UINavigationController? { get }
    var builder: BuilderProtocol? { get }
    init(navigationController: UINavigationController, builder: BuilderProtocol)
}


protocol RouterProtocol: RouterMainProtocol {
    func initialViewController()
    func popToRoot()
    func showsScreenHumanEnterNumber()
    func showsScreenThinksComputer(_ humanNumber: Int)
    func showsScreenThinksHuman()
    func showScreenScores()
}


class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var builder: BuilderProtocol?
    
    
    required init(navigationController: UINavigationController, builder: BuilderProtocol) {
        
        navigationController.navigationItem.backButtonTitle = "d"
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let vc = builder?.screenStartGameVC(router: self) else { return }
            navigationController.navigationItem.backButtonTitle = "d"
            navigationController.viewControllers = [vc]
        }
    }
    
    func showsScreenHumanEnterNumber() {
        if let navigationController = navigationController {
            guard let screenHumanEnterNumber = builder?.screenHumanEnterNumber(router: self) else { return }
            navigationController.pushViewController(screenHumanEnterNumber, animated: true)
        }
    }
    
    func showsScreenThinksComputer(_ humanNumber: Int) {
        if let navigationController = navigationController {
            guard let screenThinksComputer = builder?.screenThinksComputer(humanNumber, router: self) else { return }
            navigationController.pushViewController(screenThinksComputer, animated: true)
        }
    }
    
    func showsScreenThinksHuman() {
        if let navigationController = navigationController {
            guard let screenThinksHuman = builder?.screenThinksHuman(router: self) else { return }
            navigationController.pushViewController(screenThinksHuman, animated: true)
        }
    }
    
    func showScreenScores() {
        if let navigationController = navigationController {
            guard let screenScores = builder?.screenScores(router: self) else { return }
            navigationController.pushViewController(screenScores, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
