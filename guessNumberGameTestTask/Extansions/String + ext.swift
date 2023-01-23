//
//  String + ext.swift
//  guessNumberGameTestTask
//
//  Created by Алексей Попроцкий on 23.01.2023.
//

import Foundation


extension String {
    func isValid() -> Bool {
        if let number = Int(self), (1...100).contains(number) {
            return true
        }
        return false
    }
}
