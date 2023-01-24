//
//  ScreenHumanEnterNumberViewController.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 23.01.2023.
//

import UIKit


protocol ScreenHumanEnterNumberVCProtocol: AnyObject {
    func setNumberHuman()
    func setLabelMessage(_ text: String)
}


class ScreenHumanEnterNumberVC: UIViewController {
    
    var presenter: ScreenHumanEnterNumberPresenter!
    var landscape: [NSLayoutConstraint]?
    var portrait: [NSLayoutConstraint]?
    var isPortrait: Bool = true
    
    private let textFieldNumberHuman = UITextField().makeTextField(placeholderText: "Guess the number")
    private let labelMessage = UILabel().makeLabel()
    private let buttonEnterNumber = UIButton().makeBigButton(title: "Enter the Number")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = .white
        textFieldNumberHuman.delegate = self
        setupView()
        setupConstraints()
        setupTapForHideKeyboard()
        buttonEnterNumber.isEnabled = false
        buttonEnterNumber.addTarget(self, action: #selector(buttonEnterNumberPress), for: .touchUpInside)
    }
    
    @objc func buttonEnterNumberPress() {
        presenter.buttonEnterNumberWasPress()
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
extension ScreenHumanEnterNumberVC: UITextFieldDelegate {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if !textFieldNumberHuman.text!.isEmpty {
            buttonEnterNumber.isEnabled = true
        } else {
            buttonEnterNumber.isEnabled = false
        }
        labelMessage.isHidden = true
        return true
    }
}

// MARK: - Extension protocol
extension ScreenHumanEnterNumberVC: ScreenHumanEnterNumberVCProtocol {
    func setNumberHuman() {
        presenter.writeHumanValue(textFieldNumberHuman.text)
    }
    
    func setLabelMessage(_ text: String) {
        labelMessage.text = text
        labelMessage.isHidden = false
    }
}

// MARK: - Extension Constraints

extension ScreenHumanEnterNumberVC {
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
            textFieldNumberHuman.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textFieldNumberHuman.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textFieldNumberHuman.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textFieldNumberHuman.heightAnchor.constraint(equalToConstant: 40),
            
            labelMessage.topAnchor.constraint(equalTo: textFieldNumberHuman.bottomAnchor, constant: 20),
            labelMessage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonEnterNumber.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            buttonEnterNumber.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonEnterNumber.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            buttonEnterNumber.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        landscape = [
            textFieldNumberHuman.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            textFieldNumberHuman.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldNumberHuman.widthAnchor.constraint(equalToConstant: 300),
            textFieldNumberHuman.heightAnchor.constraint(equalToConstant: 40),
            
            labelMessage.topAnchor.constraint(equalTo: textFieldNumberHuman.bottomAnchor, constant: 20),
            labelMessage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonEnterNumber.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            buttonEnterNumber.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonEnterNumber.widthAnchor.constraint(equalToConstant: 300),
            buttonEnterNumber.heightAnchor.constraint(equalToConstant: 40)
        ]
    }
}


// MARK: - Extension for Add View

extension ScreenHumanEnterNumberVC {
    private func setupView() {
        view.addSubviewViewAndTamic(textFieldNumberHuman)
        view.addSubviewViewAndTamic(buttonEnterNumber)
        view.addSubviewViewAndTamic(labelMessage)
    }
}
