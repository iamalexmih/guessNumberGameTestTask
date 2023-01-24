//
//  ScreenScoresPresenter.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 23.01.2023.
//

import UIKit


protocol ScreenScoresPresenterProtocol {
    init(view: ScreenScoresVCProtocol, router: RouterProtocol)
    func buttonMainMenuWasPress()
}



class ScreenScoresPresenter: ScreenScoresPresenterProtocol {
    
    private unowned let view: ScreenScoresVCProtocol
    private let router: RouterProtocol
    
    
    required init(view: ScreenScoresVCProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        viewSetLabelsTryCount()
        calculateScore()
    }
    
    func buttonMainMenuWasPress() {
        router.showScreenStartGame()
    }
    
    private func calculateScore() {
        if ScoreData.shared.humanWin < ScoreData.shared.computerWin {
            view.setLabelResultGame(text: "Your Win")
        } else {
            view.setLabelResultGame(text: "Your Lose")
        }
    }
   
    
    private func viewSetLabelsTryCount() {
        view.setLabelsTryCount(human: ScoreData.shared.humanWin, computer: ScoreData.shared.computerWin)
    }
}
