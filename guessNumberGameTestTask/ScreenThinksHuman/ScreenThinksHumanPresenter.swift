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

    var humanValue: String = ""
    var resultStatusText: ResultStatus = .none
    var gameModel = GameModel()
    
    unowned let view: ScreenThinksHumanViewControllerProtocol
    let router: RouterProtocol
    
    required init(view: ScreenThinksHumanViewControllerProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        self.computerGuessedNumber()
        view.setLabelTry("Round \(gameModel.tryGuess)")
        resultLabel()
    }
    
    
    func buttonGuessWasPress() {
        view.setNumberHuman()
        humanValue.isValid()
        if humanValueValid(humanValue) {
            calculateResult(gameModel.humanNumber, gameModel.computerNumber)
        } else {
            resultStatusText = .error
        }
        calculateRound()
        view.setLabelTry("Try № \(gameModel.tryGuess)")
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
    
    
    private func humanValueValid(_ text: String) -> Bool {
        if let number = Int(text), (1...100).contains(number) {
            gameModel.humanNumber = number
            return true
        }
        return false
    }
    
    
    private func calculateRound() {
        if resultStatusText == .less || resultStatusText == .more {
            gameModel.tryGuess += 1
        }
    }
    
    
    private func calculateResult(_ numberHuman: Int, _ numberComputer: Int) {
        if numberHuman == numberComputer {
            resultStatusText = .equal
            ScoreModel.shared.humanWin = gameModel.tryGuess
        } else if numberHuman > numberComputer {
            resultStatusText = .less
        } else {
            resultStatusText = .more
        }
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
            text = "Enter correct number"
        }
        view.setResulLabel(text)
    }
}
