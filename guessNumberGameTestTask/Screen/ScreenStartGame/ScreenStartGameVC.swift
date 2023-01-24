//
//  ScreenStartGameVC.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 24.01.2023.
//

import UIKit


protocol ScreenStartGameVCProtocol: AnyObject {
    var presenter: ScreenStartGamePresenterProtocol! { get }
}


class ScreenStartGameVC: UIViewController, ScreenStartGameVCProtocol {
    var presenter: ScreenStartGamePresenterProtocol!
    private let labelTitleScreen = UILabel().makeLabel(text: "My Awesome Game")
    private let buttonStartGame = UIButton().makeBigButton(title: "Start New Game")
    private var landscape: [NSLayoutConstraint]?
    private var portrait: [NSLayoutConstraint]?
    private var isPortrait: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupConstraints()
        buttonStartGame.addTarget(self, action: #selector(buttonStartGamePress), for: .touchUpInside)
    }
    
    @objc func buttonStartGamePress() {
        presenter.buttonStartGameWasPress()
    }
}

// MARK: - Extension Constraints

extension ScreenStartGameVC {
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
            labelTitleScreen.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            labelTitleScreen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonStartGame.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            buttonStartGame.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonStartGame.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            buttonStartGame.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        landscape = [
            labelTitleScreen.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            labelTitleScreen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonStartGame.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            buttonStartGame.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStartGame.widthAnchor.constraint(equalToConstant: 300),
            buttonStartGame.heightAnchor.constraint(equalToConstant: 40)
        ]
    }
}


// MARK: - Extension for Add View
extension ScreenStartGameVC {
    private func setupView() {
        view.addSubviewViewAndTamic(labelTitleScreen)
        view.addSubviewViewAndTamic(buttonStartGame)
    }
}
