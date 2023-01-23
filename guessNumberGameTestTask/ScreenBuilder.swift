//
//  ScreenBuilder.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 23.01.2023.
//

import UIKit


protocol BuilderProtocol {
    func screenThinksComputer(gameModel: GameModel, router: RouterProtocol) -> UIViewController
    func screenThinksHuman(router: RouterProtocol) -> UIViewController
}



class SceneBuilder: BuilderProtocol {
    
    func screenThinksComputer(gameModel: GameModel, router: RouterProtocol) -> UIViewController {
        let view = ScreenThinksComputerViewController()
        let presenter = ScreenThinksComputerPresenter(view: view,
                                                      router: router,
                                                      model: gameModel)
        view.presenter = presenter
        return view
    }
    
    
    func screenThinksHuman(router: RouterProtocol) -> UIViewController {
        let view = ScreenThinksHumanViewController()
        let presenter = ScreenThinksHumanPresenter(view: view,
                                                   router: router)
        view.presenter = presenter
        return view
    }
    

}
