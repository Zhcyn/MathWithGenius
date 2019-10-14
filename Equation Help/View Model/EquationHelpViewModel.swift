//
//  EquationHelpViewModel.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 20/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation


class EquationHelpViewModel {
    
    let firstNumber: Int
    let secondNumber: Int
    let subject: String
    let helpTitle: String
    
    init (firstNumber: Int, secondNumber: Int, subject: String, helpTitle: String) {
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
        self.subject = subject
        self.helpTitle = helpTitle
    }
    
    
}
