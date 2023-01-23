//
//  ScreenThinksCopmuterPresenter.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 23.01.2023.
//

import Foundation


protocol ScreenThinksComputerPresenterProtocol: AnyObject {
    init(view: ScreenThinksComputerViewControllerProtocol, router: RouterProtocol, model: GameModel)
    func buttonEqualWasPress()
    func buttonMoreWasPress()
    func buttonLessWasPress()
    func writeHumanValue(_ value: String?)
}


class ScreenThinksComputerPresenter: ScreenThinksComputerPresenterProtocol {
    
    var humanValue: String = "55"
    var computerValue: Int = 0
    var resultStatusText: ResultStatus = .none
    var gameModel: GameModel
    var minNumber = 1
    var maxNumber = 100
    
    unowned let view: ScreenThinksComputerViewControllerProtocol
    let router: RouterProtocol
    
    
    required init(view: ScreenThinksComputerViewControllerProtocol, router: RouterProtocol, model: GameModel) {
        self.view = view
        self.router = router
        self.gameModel = model
        gameModel.humanNumber = 55
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
            ScoreModel.shared.computerWin = gameModel.tryGuess
        } else {
            resultStatusText = .error
        }
        resultLabel()
    }
    
    
    func buttonMoreWasPress() {
        if (gameModel.computerNumber...maxNumber).contains(gameModel.humanNumber) {
            minNumber = gameModel.computerNumber
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
        if (minNumber...gameModel.computerNumber).contains(gameModel.humanNumber) {
            maxNumber = gameModel.computerNumber
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
    
    
    func writeHumanValue(_ value: String?) {
        
    }
    
    
    func viewSetLabelTry() {
        view.setLabelTry("Try № \(gameModel.tryGuess)")
    }
    
    
    func viewSetLabelThinksComputer() {
        view.setLabelThinksComputer("Your number is - \(gameModel.computerNumber)?")
    }
 
}
