//
//  ScreenStartGamePresenter.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 24.01.2023.
//

import UIKit


protocol ScreenStartGamePresenterProtocol: AnyObject {
    init(view: ScreenStartGameVCProtocol, router: RouterProtocol)
    func buttonStartGameWasPress()
}


class ScreenStartGamePresenter: ScreenStartGamePresenterProtocol {
    
    private unowned let view: ScreenStartGameVCProtocol
    private let router: RouterProtocol
    
    required init(view: ScreenStartGameVCProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        resetScore()
    }
    
    private func resetScore() {
        ScoreData.shared.computerWin = 0
        ScoreData.shared.humanWin = 0
    }
    
    func buttonStartGameWasPress() {
        router.showsScreenHumanEnterNumber()
    }
}
