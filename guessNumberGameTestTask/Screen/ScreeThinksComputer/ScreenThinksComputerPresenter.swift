//
//  ScreenThinksCopmuterPresenter.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 23.01.2023.
//

import Foundation


protocol ScreenThinksComputerPresenterProtocol: AnyObject {
    init(view: ScreenThinksComputerViewControllerProtocol, router: RouterProtocol, humanNumber: Int)
    func buttonEqualWasPress()
    func buttonMoreWasPress()
    func buttonLessWasPress()
}


class ScreenThinksComputerPresenter: ScreenThinksComputerPresenterProtocol {
    
    var resultStatusText: ResultStatus = .none
    var gameModel: GameModel
    var minNumber = 1
    var maxNumber = 100
    
    unowned let view: ScreenThinksComputerViewControllerProtocol
    private let router: RouterProtocol
    
    
    required init(view: ScreenThinksComputerViewControllerProtocol, router: RouterProtocol, humanNumber: Int) {
        self.view = view
        self.router = router
        self.gameModel = GameModel(humanNumber: humanNumber)
        computerThinksNumber()
        viewSetLabelTry()
        viewSetLabelThinksComputer()
    }

    
    private func computerThinksNumber() {
        gameModel.computerNumber = Array(minNumber...maxNumber).randomElement()!
    }
    
    
    func buttonEqualWasPress() {
        if gameModel.humanNumber == gameModel.computerNumber {
            resultStatusText = .equal
            ScoreData.shared.computerWin = gameModel.tryGuess
            router.showsScreenThinksHuman()
        } else {
            resultStatusText = .error
        }
        resultLabel()
    }
    
    
    func buttonMoreWasPress() {
        if (gameModel.computerNumber...maxNumber).contains(gameModel.humanNumber) &&
            gameModel.humanNumber != gameModel.computerNumber {
            if minNumber < maxNumber {
                minNumber = gameModel.computerNumber + 1
            }
            print("buttonMoreWasPress min: \(minNumber), max: \(maxNumber)")
            resultStatusText = .more
            computerThinksNumber()
            viewSetLabelThinksComputer()
            calculateRound()
            viewSetLabelTry()
        } else {
            resultStatusText = .error
        }
        resultLabel()
    }
    
    
    func buttonLessWasPress() {
        if (minNumber...gameModel.computerNumber).contains(gameModel.humanNumber) &&
            gameModel.humanNumber != gameModel.computerNumber {
            if minNumber < maxNumber {
                maxNumber = gameModel.computerNumber - 1
            }
            print("buttonLessWasPress min: \(minNumber), max: \(maxNumber)")
            resultStatusText = .less
            computerThinksNumber()
            viewSetLabelThinksComputer()
            calculateRound()
            viewSetLabelTry()
        } else {
            resultStatusText = .error
        }
        resultLabel()
    }
    
    
    private func resultLabel() {
        var text = ""
        switch resultStatusText {
        case .error:
            text = "Your answer is not correct"
        case .equal:
            text = "Game End"
        default:
            text = "My number is ..."
        }
        view.setLabelHumanAnswer(text)
    }
    
    
    private func calculateRound() {
        if resultStatusText == .less || resultStatusText == .more {
            gameModel.tryGuess += 1
        }
    }
    
    
    private func viewSetLabelTry() {
        view.setLabelTry("Try № \(gameModel.tryGuess)")
    }
    
    
    private func viewSetLabelThinksComputer() {
        view.setLabelThinksComputer("Your number is - \(gameModel.computerNumber)?")
    }
 
}
