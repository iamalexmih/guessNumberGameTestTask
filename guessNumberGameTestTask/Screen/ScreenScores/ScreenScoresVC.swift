//
//  ScreenScoresVC.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 23.01.2023.
//

import UIKit


protocol ScreenScoresVCProtocol: AnyObject {
    func setLabelsTryCount(human: Int, computer: Int)
    func setLabelResultGame(text: String)
}


class ScreenScoresVC: UIViewController {
    
    var presenter: ScreenScoresPresenterProtocol!
    var landscape: [NSLayoutConstraint]?
    var portrait: [NSLayoutConstraint]?
    var isPortrait: Bool = true
    
    private let labelTitleScreen = UILabel().makeLabel(text: "Scores:")
    private let labelHumanTryCount = UILabel().makeLabel()
    private let labelComputerTryCount = UILabel().makeLabel()
    private let labelResultGame = UILabel().makeLabel()
    private let buttonMainMenu = UIButton().makeBigButton(title: "Main menu")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupView()
        setupConstraints()

        buttonMainMenu.addTarget(self, action: #selector(buttonMainMenuPress), for: .touchUpInside)
    }
    
    
    @objc func buttonMainMenuPress() {
        presenter.buttonMainMenuWasPress()
    }
}

// MARK: - Extension protocol

extension ScreenScoresVC: ScreenScoresVCProtocol {
    func setLabelsTryCount(human: Int, computer: Int) {
        labelHumanTryCount.text = "Your's tries count: \(human)"
        labelComputerTryCount.text = "Computer's tries count: \(computer)"
    }
    
    func setLabelResultGame(text: String) {
        labelResultGame.text = text
    }
}

// MARK: - Extension Constraints

extension ScreenScoresVC {
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        isPortrait = UIDevice.current.orientation.isPortrait

        if isPortrait {
            NSLayoutConstraint.deactivate(landscape!)
            NSLayoutConstraint.activate(portrait!)
        } else {
            NSLayoutConstraint.deactivate(portrait!)
            NSLayoutConstraint.activate(landscape!)
        }
    }
    
    private func setupConstraints() {
        portrait = [
            labelTitleScreen.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            labelTitleScreen.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            labelHumanTryCount.topAnchor.constraint(equalTo: labelTitleScreen.bottomAnchor, constant: 80),
            labelHumanTryCount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            labelComputerTryCount.topAnchor.constraint(equalTo: labelHumanTryCount.bottomAnchor, constant: 20),
            labelComputerTryCount.leadingAnchor.constraint(equalTo: labelHumanTryCount.leadingAnchor),

            labelResultGame.bottomAnchor.constraint(equalTo: buttonMainMenu.topAnchor, constant: -60),
            labelResultGame.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonMainMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            buttonMainMenu.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonMainMenu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            buttonMainMenu.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        landscape = [
            labelTitleScreen.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            labelTitleScreen.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            labelHumanTryCount.topAnchor.constraint(equalTo: labelTitleScreen.bottomAnchor, constant: 40),
            labelHumanTryCount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),

            labelComputerTryCount.topAnchor.constraint(equalTo: labelHumanTryCount.bottomAnchor, constant: 20),
            labelComputerTryCount.leadingAnchor.constraint(equalTo: labelHumanTryCount.leadingAnchor),

            labelResultGame.bottomAnchor.constraint(equalTo: buttonMainMenu.topAnchor, constant: -30),
            labelResultGame.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonMainMenu.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            buttonMainMenu.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonMainMenu.widthAnchor.constraint(equalToConstant: 300),
            buttonMainMenu.heightAnchor.constraint(equalToConstant: 40)
        ]
    }
}


// MARK: - Extension for setupView and Constraints
extension ScreenScoresVC {
    private func setupView() {
        view.addSubviewViewAndTamic(labelTitleScreen)
        view.addSubviewViewAndTamic(labelHumanTryCount)
        view.addSubviewViewAndTamic(labelComputerTryCount)
        view.addSubviewViewAndTamic(labelResultGame)
        view.addSubviewViewAndTamic(buttonMainMenu)
    }
}
