//
//  TestScreenThinksComputerPresenter.swift
//  guessNumberGameTestTaskTests
//
//  Created by Алексей Попроцкий on 24.01.2023.
//

import XCTest

class MockViewThinksComputer: ScreenThinksComputerViewControllerProtocol {
    func setLabelTry(_ text: String) { }
    func setLabelThinksComputer(_ text: String) { }
    func setLabelHumanAnswer(_ text: String) { }
}


@testable import guessNumberGameTestTask
final class TestScreenThinksComputerPresenter: XCTestCase {
    
    var view: MockViewThinksComputer!
    var presenter: ScreenThinksComputerPresenter!
    var router: RouterProtocol!
    
    override func setUpWithError() throws {
        let viewController = UIViewController()
        let screenBuilder = ScreenBuilder()
        router = Router(viewController: viewController, builder: screenBuilder)
        view = MockViewThinksComputer()
    }

    override func tearDownWithError() throws {
        view = nil
        presenter = nil
        router = nil
    }

   
    func testButtonLessWasPressRangeDoesNotChange() {
        presenter = ScreenThinksComputerPresenter(view: view,
                                                  router: router,
                                                  humanNumber: 33)
        presenter.minNumber = 33
        presenter.maxNumber = 33
        presenter.gameModel.humanNumber = 33
        presenter.gameModel.computerNumber = 33
        presenter.buttonLessWasPress()
        XCTAssertEqual(presenter.minNumber, presenter.maxNumber)
    }

    func testButtonLessWasPressMinLessThanMax() {
        presenter = ScreenThinksComputerPresenter(view: view,
                                                  router: router,
                                                  humanNumber: 33)
        presenter.minNumber = 30
        presenter.maxNumber = 44
        presenter.gameModel.computerNumber = 40
        presenter.buttonLessWasPress()
        XCTAssertLessThan(presenter.minNumber, presenter.maxNumber)
    }
    
    func testButtonLessWasPressHumanNumberNotContainsRange() {
        presenter = ScreenThinksComputerPresenter(view: view,
                                                  router: router,
                                                  humanNumber: 50)
        presenter.minNumber = 30
        presenter.maxNumber = 44
        presenter.gameModel.computerNumber = 40
        presenter.buttonLessWasPress()
        let status = presenter.resultStatusText
        XCTAssertEqual(status, .error)
    }
    
    func testCalculateRoundRightAnswer() {
        presenter = ScreenThinksComputerPresenter(view: view,
                                                  router: router,
                                                  humanNumber: 33)
        presenter.gameModel.computerNumber = 40
        presenter.buttonLessWasPress()
        XCTAssertEqual(presenter.gameModel.tryGuess, 2)
    }
 
    
    func testCalculateRoundWrongAnswer() {
        presenter = ScreenThinksComputerPresenter(view: view,
                                                  router: router,
                                                  humanNumber: 55)
        presenter.gameModel.computerNumber = 40
        presenter.buttonLessWasPress()
        XCTAssertEqual(presenter.gameModel.tryGuess, 1)
    }
    
    
    func testFuncComputerThinksNumberGenerateNumberWithinRange() {
        presenter = ScreenThinksComputerPresenter(view: view,
                                                  router: router,
                                                  humanNumber: 55)
        let min = 1
        let max = 100
        let resultTrue = (min...max).contains(presenter.gameModel.computerNumber)
        XCTAssertEqual(resultTrue, true)
    }
}
