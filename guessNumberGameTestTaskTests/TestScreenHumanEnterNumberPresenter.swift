//
//  TestScreenHumanEnterNumberPresenter.swift
//  guessNumberGameTestTaskTests
//
//  Created by Алексей Попроцкий on 24.01.2023.
//

import XCTest


class MockViewHumanEnterNumber: ScreenHumanEnterNumberVCProtocol {
    func setNumberHuman() { }
    func setLabelMessage(_ text: String) { }
}


@testable import guessNumberGameTestTask
final class TestScreenHumanEnterNumberPresenter: XCTestCase {

    var view: MockViewHumanEnterNumber!
    var presenter: ScreenHumanEnterNumberPresenter!
    var router: RouterProtocol!
    
    override func setUpWithError() throws {
        let viewController = UIViewController()
        let screenBuilder = ScreenBuilder()
        router = Router(viewController: viewController, builder: screenBuilder)
        view = MockViewHumanEnterNumber()
    }
    

    override func tearDownWithError() throws {
        view = nil
        presenter = nil
        router = nil
    }

    func testWriteHumanValueIfTextFieldEmpty() {
        presenter = ScreenHumanEnterNumberPresenter(view: view,
                                                    router: router)
        presenter.writeHumanValue(nil)
        XCTAssertEqual(presenter.humanValue, "")
    }
    
    func testHumanValueValidIsInt() {
        presenter = ScreenHumanEnterNumberPresenter(view: view,
                                                    router: router)
        presenter.writeHumanValue("55")
        let validTrue = presenter.humanValue.isValid()
        XCTAssertEqual(validTrue, true)
    }
    
    func testHumanValueValidIsNotInt() {
        presenter = ScreenHumanEnterNumberPresenter(view: view,
                                                    router: router)
        presenter.writeHumanValue("Foo")
        let validTrue = presenter.humanValue.isValid()
        XCTAssertEqual(validTrue, false)
    }
    
    func testHumanValueValidMoreRange() {
        presenter = ScreenHumanEnterNumberPresenter(view: view,
                                                    router: router)
        presenter.writeHumanValue("999")
        let validTrue = presenter.humanValue.isValid()
        XCTAssertEqual(validTrue, false)
    }
}
