//
//  ScreenHumanEnterNumberViewController.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 23.01.2023.
//

import UIKit


protocol ScreenHumanEnterNumberVCProtocol: AnyObject {
    func setNumberHuman()
}


class ScreenHumanEnterNumberVC: UIViewController {
    
    var presenter: ScreenHumanEnterNumberPresenter!
    
    private let textFieldNumberHuman: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        return textField
    }()
    
    
    private let buttonEnterNumber: BaseButton = {
        let button = BaseButton(type: .system)
        button.setTitle("Enter the Number", for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = .white
        setupView()
        setupConstraints()
        
        buttonEnterNumber.addTarget(self, action: #selector(buttonEnterNumberPress), for: .touchUpInside)
    }
    
    @objc func buttonEnterNumberPress() {
        presenter.buttonEnterNumberWasPress()
    }
}

// MARK: - Extension protocol
extension ScreenHumanEnterNumberVC: ScreenHumanEnterNumberVCProtocol {
    func setNumberHuman() {
        presenter.writeHumanValue(textFieldNumberHuman.text)
    }
}

// MARK: - setupView and Constraints

extension ScreenHumanEnterNumberVC {

    private func setupView() {
        view.addSubviewViewAndTamic(textFieldNumberHuman)
        view.addSubviewViewAndTamic(buttonEnterNumber)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            textFieldNumberHuman.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textFieldNumberHuman.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textFieldNumberHuman.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textFieldNumberHuman.heightAnchor.constraint(equalToConstant: 40),
            
            buttonEnterNumber.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            buttonEnterNumber.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            buttonEnterNumber.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            buttonEnterNumber.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
