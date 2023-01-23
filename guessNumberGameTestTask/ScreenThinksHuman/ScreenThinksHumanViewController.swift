//
//  ScreenGuessComputerViewController.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 22.01.2023.
//

import UIKit


protocol ScreenThinksHumanViewControllerProtocol: AnyObject {
    func setNumberHuman()
    func setResulLabel(_ text: String)
    func setLabelTry(_ text: String)
}


class ScreenThinksHumanViewController: UIViewController {

    var presenter: ScreenThinksHumanPresenterProtocol!
    
    private let labelTry: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "1"
        return label
    }()
    
    private let labelRoundStart: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "You are guessing"
        return label
    }()
    
    private let textFieldNumberHuman: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        return textField
    }()
    
    private let buttonGuess: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Guess", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }()
    
    private let labelResult: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "3"
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = .white
        setupView()
        setupConstraints()
        
        buttonGuess.addTarget(self, action: #selector(buttonGuessPress), for: .touchUpInside)
    }

    
    @objc func buttonGuessPress() {
        presenter.buttonGuessWasPress()
    }
}


// MARK: - Extension protocol

extension ScreenThinksHumanViewController: ScreenThinksHumanViewControllerProtocol {
    func setLabelTry(_ text: String) {
        labelTry.text = text
    }
    
    func setNumberHuman() {
        presenter.writeHumanValue(textFieldNumberHuman.text)
    }
    
    func setResulLabel(_ text: String) {
        labelResult.text = text
    }
}

// MARK: - setupView and Constraints
extension ScreenThinksHumanViewController {

    private func setupView() {
        view.addSubviewViewAndTamic(labelTry)
        view.addSubviewViewAndTamic(labelRoundStart)
        view.addSubviewViewAndTamic(textFieldNumberHuman)
        view.addSubviewViewAndTamic(buttonGuess)
        view.addSubviewViewAndTamic(labelResult)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            labelTry.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            labelTry.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            labelRoundStart.topAnchor.constraint(equalTo: labelTry.bottomAnchor, constant: 20),
            labelRoundStart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
            textFieldNumberHuman.topAnchor.constraint(equalTo: labelRoundStart.bottomAnchor, constant: 50),
            textFieldNumberHuman.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textFieldNumberHuman.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textFieldNumberHuman.heightAnchor.constraint(equalToConstant: 40),
            
            buttonGuess.topAnchor.constraint(equalTo: textFieldNumberHuman.bottomAnchor, constant: 50),
            buttonGuess.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonGuess.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            buttonGuess.heightAnchor.constraint(equalToConstant: 40),
            
            labelResult.topAnchor.constraint(equalTo: buttonGuess.bottomAnchor, constant: 50),
            labelResult.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
