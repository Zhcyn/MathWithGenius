//
//  HelpScreenViewModel.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 30/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation


class HelpScreenViewModel {
    
    let firstNumber: Int
    let secondNumber: Int
    let subject: String
    
    init (firstNumber: Int, secondNumber: Int, subject: String) {
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
        self.subject = subject
    }
    
}
