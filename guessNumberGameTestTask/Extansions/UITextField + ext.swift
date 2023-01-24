//
//  UITextField + ext.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 24.01.2023.
//

import UIKit

extension UITextField {
    func makeTextField(placeholderText: String) -> UITextField {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.clearButtonMode = .whileEditing
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText,
                                                             attributes: [
                                                                NSAttributedString.Key.foregroundColor: UIColor.gray
                                                             ])
        textField.textColor = .black
        textField.keyboardType = .numberPad
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        return textField
    }
}
