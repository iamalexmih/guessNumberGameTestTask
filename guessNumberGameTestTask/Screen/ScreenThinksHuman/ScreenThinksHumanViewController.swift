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
    var landscape: [NSLayoutConstraint]?
    var portrait: [NSLayoutConstraint]?
    var isPortrait: Bool = true
    
    private let labelTry = UILabel().makeLabel()
    private let labelRoundStart = UILabel().makeLabel(text: "You are guessing")
    private let textFieldNumberHuman = UITextField().makeTextField(placeholderText: "Enter the number")
    private let buttonGuess = UIButton().makeBigButton(title: "Guess")
    private let labelResult = UILabel().makeLabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        textFieldNumberHuman.delegate = self
        view.backgroundColor = .white
        setupView()
        setupConstraints()
        setupTapForHideKeyboard()
        buttonGuess.isEnabled = false
        buttonGuess.addTarget(self, action: #selector(buttonGuessPress), for: .touchUpInside)
    }

    
    @objc func buttonGuessPress() {
        presenter.buttonGuessWasPress()
    }
    
    private func setupTapForHideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Extension UITextFieldDelegate
extension ScreenThinksHumanViewController: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if !textFieldNumberHuman.text!.isEmpty {
            buttonGuess.isEnabled = true
        } else {
            buttonGuess.isEnabled = false
        }
        return true
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

// MARK: - Extension Constraints

extension ScreenThinksHumanViewController {
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
        ]
        
        landscape = [
            labelTry.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            labelTry.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            labelRoundStart.topAnchor.constraint(equalTo: labelTry.bottomAnchor, constant: 15),
            labelRoundStart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
            textFieldNumberHuman.topAnchor.constraint(equalTo: labelRoundStart.bottomAnchor, constant: 30),
            textFieldNumberHuman.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldNumberHuman.widthAnchor.constraint(equalToConstant: 300),
            textFieldNumberHuman.heightAnchor.constraint(equalToConstant: 40),
            
            buttonGuess.topAnchor.constraint(equalTo: textFieldNumberHuman.bottomAnchor, constant: 40),
            buttonGuess.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonGuess.widthAnchor.constraint(equalToConstant: 300),
            buttonGuess.heightAnchor.constraint(equalToConstant: 40),
            
            labelResult.topAnchor.constraint(equalTo: buttonGuess.bottomAnchor, constant: 20),
            labelResult.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
    }
}


// MARK: - Extension for Add View
extension ScreenThinksHumanViewController {
    private func setupView() {
        view.addSubviewViewAndTamic(labelTry)
        view.addSubviewViewAndTamic(labelRoundStart)
        view.addSubviewViewAndTamic(textFieldNumberHuman)
        view.addSubviewViewAndTamic(buttonGuess)
        view.addSubviewViewAndTamic(labelResult)
    }
}
