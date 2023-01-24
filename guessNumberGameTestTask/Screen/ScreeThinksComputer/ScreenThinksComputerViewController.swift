//
//  ScreenThinksComputerViewController.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 23.01.2023.
//

import UIKit


protocol ScreenThinksComputerViewControllerProtocol: AnyObject {
    func setLabelTry(_ text: String)
    func setLabelThinksComputer(_ text: String)
    func setLabelHumanAnswer(_ text: String)
}


class ScreenThinksComputerViewController: UIViewController {
    
    var presenter: ScreenThinksComputerPresenterProtocol!
    var landscape: [NSLayoutConstraint]?
    var portrait: [NSLayoutConstraint]?
    var isPortrait: Bool = true
    
    private let labelTry = UILabel().makeLabel()
    private let labelRoundStart = UILabel().makeLabel(text: "Computer is guessing")
    private let labelThinksComputer = UILabel().makeLabel()
    private let labelHumanAnswer = UILabel().makeLabel()
    
    private let buttonEqual = UIButton().makeSmallButton(title: "=")
    private let buttonMore = UIButton().makeSmallButton(title: ">")
    private let buttonLess = UIButton().makeSmallButton(title: "<")


    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupView()
        setupConstraints()

        buttonEqual.addTarget(self, action: #selector(buttonEqualPress), for: .touchUpInside)
        buttonMore.addTarget(self, action: #selector(buttonMorePress), for: .touchUpInside)
        buttonLess.addTarget(self, action: #selector(buttonLessPress), for: .touchUpInside)
    }
 
    // MARK: - Button Actions
    @objc func buttonEqualPress() {
        presenter.buttonEqualWasPress()
    }
    
    
    @objc func buttonMorePress() {
        presenter.buttonMoreWasPress()
    }
    
    
    @objc func buttonLessPress() {
        presenter.buttonLessWasPress()
    }
}


// MARK: - Extension protocol

extension ScreenThinksComputerViewController: ScreenThinksComputerViewControllerProtocol {
    func setLabelTry(_ text: String) {
        labelTry.text = text
    }
    
    func setLabelThinksComputer(_ text: String) {
        labelThinksComputer.text = text
    }
    
    func setLabelHumanAnswer(_ text: String) {
        labelHumanAnswer.text = text
    }
}

// MARK: - Extension Constraints

extension ScreenThinksComputerViewController {
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

            labelThinksComputer.topAnchor.constraint(equalTo: labelRoundStart.bottomAnchor, constant: 50),
            labelThinksComputer.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            labelHumanAnswer.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -15),
            labelHumanAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 170),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        landscape = [
            labelTry.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            labelTry.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            labelRoundStart.topAnchor.constraint(equalTo: labelTry.bottomAnchor, constant: 15),
            labelRoundStart.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            labelThinksComputer.topAnchor.constraint(equalTo: labelRoundStart.bottomAnchor, constant: 30),
            labelThinksComputer.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            labelHumanAnswer.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -15),
            labelHumanAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 170),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ]
    }
}


// MARK: - Extension for Add View
extension ScreenThinksComputerViewController {
    private func setupView() {
        view.addSubviewViewAndTamic(labelTry)
        view.addSubviewViewAndTamic(labelRoundStart)
        view.addSubviewViewAndTamic(labelThinksComputer)
        view.addSubviewViewAndTamic(labelHumanAnswer)
        view.addSubviewViewAndTamic(stackView)
        stackView.addArrangedSubview(buttonMore)
        stackView.addArrangedSubview(buttonEqual)
        stackView.addArrangedSubview(buttonLess)
    }
}
