//
//  BaseButton.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 23.01.2023.
//

import UIKit


class BaseButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        tintColor = .white
        layer.cornerRadius = 15
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
