//
//  ScreenGuessComputerPresenter.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 22.01.2023.
//

import Foundation



protocol ScreenThinksHumanPresenterProtocol: AnyObject {
    init(view: ScreenThinksHumanViewControllerProtocol, router: RouterProtocol)
    func buttonGuessWasPress()
    func writeHumanValue(_ value: String?)
}


class ScreenThinksHumanPresenter: ScreenThinksHumanPresenterProtocol {

    private var humanValue: String = ""
    private var resultStatusText: ResultStatus = .none
    private var gameModel = GameModel()
    
    private unowned let view: ScreenThinksHumanViewControllerProtocol
    private let router: RouterProtocol
    
    required init(view: ScreenThinksHumanViewControllerProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        self.computerGuessedNumber()
        viewSetLabelTry()
        resultLabel()
    }
    
    
    func buttonGuessWasPress() {
        view.setNumberHuman()
        if humanValue.isValid() {
            gameModel.humanNumber = Int(humanValue)!
            calculateResult(gameModel.humanNumber, gameModel.computerNumber)
        } else {
            resultStatusText = .error
        }
        calculateRound()
        viewSetLabelTry()
        resultLabel()
    }
    
    
    func writeHumanValue(_ value: String?) {
        if let value = value, value != "" {
            humanValue = value
        }
    }
    
    
    private func computerGuessedNumber() {
        gameModel.computerNumber = (1...100).randomElement()!
    }
    
    
    private func calculateRound() {
        if resultStatusText == .less || resultStatusText == .more {
            gameModel.tryGuess += 1
        }
    }
    
    
    private func calculateResult(_ numberHuman: Int, _ numberComputer: Int) {
        if numberHuman == numberComputer {
            resultStatusText = .equal
            ScoreData.shared.humanWin = gameModel.tryGuess
            router.showScreenScores()
        } else if numberHuman > numberComputer {
            resultStatusText = .less
        } else {
            resultStatusText = .more
        }
    }
    
    
    private func viewSetLabelTry() {
        view.setLabelTry("Try № \(gameModel.tryGuess)")
    }
    
    
    private func resultLabel() {
        var text = ""
        switch resultStatusText {
        case .none:
            text = ""
        case .equal:
            text = "Yes, you guessed the number"
        case .more:
            text = "No, my number is more than yours"
        case .less:
            text = "No, my number is less than yours"
        case .error:
            text = "Enter correct number in the range 1...100"
        }
        view.setResulLabel(text)
    }
}
