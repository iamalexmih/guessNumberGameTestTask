//
//  ScreenHumanEnterNumberPresenter.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 23.01.2023.
//

import UIKit


protocol ScreenHumanEnterNumberPresenterProtocol: AnyObject {
    init(view: ScreenHumanEnterNumberVCProtocol)
    func buttonEnterNumberWasPress()
    func writeHumanValue(_ value: String?)
}



class ScreenHumanEnterNumberPresenter: ScreenHumanEnterNumberPresenterProtocol {

    var humanValue: String = ""
    
    unowned let view: ScreenHumanEnterNumberVCProtocol
    
    required init(view: ScreenHumanEnterNumberVCProtocol) {
        self.view = view
    }
    
    
    func buttonEnterNumberWasPress() {
        view.setNumberHuman()
    }
    
    
    private func humanValueValid(_ text: String) -> Bool {
        if let number = Int(text), (1...100).contains(number) {
//            gameModel.humanNumber = number
            return true
        }
        return false
    }
    
    
    func writeHumanValue(_ value: String?) {
        if let value = value, value != "" {
            humanValue = value
        }
    }
}
