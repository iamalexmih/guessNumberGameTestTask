//
//  ScreenHumanEnterNumberPresenter.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 23.01.2023.
//

import UIKit


protocol ScreenHumanEnterNumberPresenterProtocol: AnyObject {
    init(view: ScreenHumanEnterNumberVCProtocol, router: RouterProtocol)
    func buttonEnterNumberWasPress()
    func writeHumanValue(_ value: String?)
}



class ScreenHumanEnterNumberPresenter: ScreenHumanEnterNumberPresenterProtocol {

    private var humanValue: String = ""
    
    private unowned let view: ScreenHumanEnterNumberVCProtocol
    private let router: RouterProtocol
    
    required init(view: ScreenHumanEnterNumberVCProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    
    func buttonEnterNumberWasPress() {
        view.setNumberHuman()
        if humanValue.isValid() {
            let humanNumber = Int(humanValue)!
            router.showsScreenThinksComputer(humanNumber)
        } else {
            view.setLabelMessage("Enter correct number in the range 1...100")
        }
    }
    
    
    func writeHumanValue(_ value: String?) {
        if let value = value, value != "" {
            humanValue = value
        }
    }
}
