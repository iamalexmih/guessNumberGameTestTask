//
//  Router.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 23.01.2023.
//

import UIKit


protocol RouterMainProtocol {
    var builder: BuilderProtocol? { get set }
    init(builder: BuilderProtocol)
}

protocol RouterProtocol: RouterMainProtocol {
//    func initialViewController()
    func showsSreenThinksComputer()
    func showsScreenThinksHuman() -> UIViewController
}


class Router: RouterProtocol {
    var builder: BuilderProtocol?
    
    required init(builder: BuilderProtocol) {
        self.builder = builder
    }
    
    func showsSreenThinksComputer() {
//        builder?.screenThinksComputer(gameModel: <#T##GameModel#>, router: self)
    }
    
    func showsScreenThinksHuman() -> UIViewController {
        if let builder = builder {
            return builder.screenThinksHuman(router: self)
        }
        return UIViewController()
    }
}
