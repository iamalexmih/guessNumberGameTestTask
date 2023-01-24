//
//  RouterTest.swift
//  guessNumberGameTestTaskTests
//
//  Created by Алексей Попроцкий on 24.01.2023.
//

import XCTest


class MockViewController: UIViewController {
    var presentedVC: UIViewController?
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentedVC = viewControllerToPresent
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
}


@testable import guessNumberGameTestTask
final class TestRouter: XCTestCase {

    var router: RouterProtocol!
    let screenBuilder = ScreenBuilder()
    let viewController = MockViewController()
    
    
    override func setUpWithError() throws {
        router = Router(viewController: viewController, builder: screenBuilder)
    }

    
    func testRouterShowsScreenStartGame() {
        router.showScreenStartGame()
        let screenStartGameVC = viewController.presentedVC
        XCTAssertTrue(screenStartGameVC is ScreenStartGameVC)
    }
    
    func testRouterShowsScreenHumanEnterNumber() {
        router.showsScreenHumanEnterNumber()
        let screenHumanEnterNumberVC = viewController.presentedVC
        XCTAssertTrue(screenHumanEnterNumberVC is ScreenHumanEnterNumberVC)
    }
    
    func testRouterShowsScreenThinksComputer() {
        router.showsScreenThinksComputer(33)
        let screenThinksComputer = viewController.presentedVC
        XCTAssertTrue(screenThinksComputer is ScreenThinksComputerViewController)
    }
    
    func testRouterShowsScreenThinksHuman() {
        router.showsScreenThinksHuman()
        let screenThinksHumanViewController = viewController.presentedVC
        XCTAssertTrue(screenThinksHumanViewController is ScreenThinksHumanViewController)
    }
    
    func testRouterShowsScreenScores() {
        router.showScreenScores()
        let screenScoresVC = viewController.presentedVC
        XCTAssertTrue(screenScoresVC is ScreenScoresVC)
    }
}
