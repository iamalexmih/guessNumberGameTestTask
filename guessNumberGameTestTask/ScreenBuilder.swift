//
//  ScreenBuilder.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 23.01.2023.
//

import UIKit


protocol BuilderProtocol {
    func screenStartGameVC(router: RouterProtocol)  -> UIViewController
    func screenHumanEnterNumber(router: RouterProtocol) -> UIViewController
    func screenThinksComputer(_ humanNumber: Int, router: RouterProtocol) -> UIViewController
    func screenThinksHuman(router: RouterProtocol) -> UIViewController
    func screenScores(router: RouterProtocol) -> UIViewController
}



class ScreenBuilder: BuilderProtocol {
    
    func screenStartGameVC(router: RouterProtocol)  -> UIViewController {
        let view = ScreenStartGameVC()
        let presenter = ScreenStartGamePresenter(view: view,
                                                 router: router)
        view.presenter = presenter
        return view
    }
    
    
    func screenHumanEnterNumber(router: RouterProtocol) -> UIViewController {
        let view = ScreenHumanEnterNumberVC()
        let presenter = ScreenHumanEnterNumberPresenter(view: view,
                                                      router: router)
        view.presenter = presenter
        return view
    }
    
    
    func screenThinksComputer(_ humanNumber: Int, router: RouterProtocol) -> UIViewController {
        let view = ScreenThinksComputerViewController()
        let presenter = ScreenThinksComputerPresenter(view: view,
                                                      router: router,
                                                      humanNumber: humanNumber)
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
    
    func screenScores(router: RouterProtocol) -> UIViewController {
        let view = ScreenScoresVC()
        let presenter = ScreenScoresPresenter(view: view,
                                              router: router)
        view.presenter = presenter
        return view
    }
}
