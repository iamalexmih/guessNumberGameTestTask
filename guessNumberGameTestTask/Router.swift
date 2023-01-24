//
//  Router.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 23.01.2023.
//

import UIKit


protocol RouterMainProtocol {
    var viewController: UIViewController? { get set }
    var builder: BuilderProtocol? { get set }
    init(viewController: UIViewController, builder: BuilderProtocol)
}

protocol RouterProtocol: RouterMainProtocol {
    func showScreenStartGame()
    func showsScreenHumanEnterNumber()
    func showsScreenThinksComputer(_ humanNumber: Int)
    func showsScreenThinksHuman()
    func showScreenScores()
}


class Router: RouterProtocol {
    
    var viewController: UIViewController?
    var builder: BuilderProtocol?
    
    required init(viewController: UIViewController, builder: BuilderProtocol) {
        self.viewController = viewController
        self.builder = builder
    }
    
    
    func showScreenStartGame() {
        if let viewController = viewController, let builder = builder {
            let vc = builder.screenStartGameVC(router: self)
            vc.modalPresentationStyle = .fullScreen
            viewController.present(vc, animated: true)
            self.viewController = vc
        }
    }
    
    
    func showsScreenHumanEnterNumber() {
        if let viewController = viewController, let builder = builder {
            let vc = builder.screenHumanEnterNumber(router: self)
            vc.modalPresentationStyle = .fullScreen
            viewController.present(vc, animated: true)
            self.viewController = vc
        }
    }
    
    
    func showsScreenThinksComputer(_ humanNumber: Int) {
        if let viewController = viewController, let builder = builder {
            let vc = builder.screenThinksComputer(humanNumber, router: self)
            vc.modalPresentationStyle = .fullScreen
            viewController.present(vc, animated: true)
            self.viewController = vc
        }
    }
    
    func showsScreenThinksHuman() {
        if let viewController = viewController, let builder = builder {
            let vc = builder.screenThinksHuman(router: self)
            vc.modalPresentationStyle = .fullScreen
            viewController.present(vc, animated: true)
            self.viewController = vc
        }
    }
    
    func showScreenScores() {
        if let viewController = viewController, let builder = builder {
            let vc = builder.screenScores(router: self)
            vc.modalPresentationStyle = .fullScreen
            viewController.present(vc, animated: true)
            self.viewController = vc
        }
    }
}
