//
//  UILabel + ext.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 24.01.2023.
//

import UIKit


extension UILabel {
    func makeLabel(text: String? = nil) -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.text = text
        label.numberOfLines = 0
        return label
    }
}
