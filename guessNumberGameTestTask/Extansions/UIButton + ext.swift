//
//  UIButton + ext.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 24.01.2023.
//

import UIKit


extension UIButton {
    func makeBigButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        return button
    }
    
    
    func makeSmallButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = .white
        button.tintColor = .black
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }
}
