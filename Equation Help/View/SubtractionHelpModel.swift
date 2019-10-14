//
//  EquationHelpView.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 20/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class SubtractionHelpModel {
    
    let subtractByBorrowingStepText = ["To start, write the numbers in a vertical column, with the number you are taking away from on top and the number you are taking away on the bottom. Ensuring the numbers line up with their place values.",
                    "Now subtract the unit in the socond row from the unit in the first row. If the unit in the second row is larger than the unit in the secon row you will need to \"borrow\" from the tens number in the first row.\nSo cross out the tens number and write the new tens number which is 1 less. And add the 1 from the tens to the unit to show a 2 digit number. Now subtract the second number unit from the new number in the first number units and write the number below the line",
                    "Now repeat this until all of the numbers on the second row are gone. Remembering to \"Borrow\" numbers from the next number to the left if the second row number is larger than the first row number.",
                    "If you want to double chack you have the right answer you can just add together your second row number and the answer, and if correct you will get your first row answer."]
    
    let subtractByBorrowingStepImage: [UIImage] = [UIImage(named: "subtractByBorrowingStep1")!,
                                UIImage(named: "subtractByBorrowingStep2")!,
                                UIImage(named: "subtractByBorrowingStep3")!,
                                UIImage(named: "subtractByBorrowingStep4")!]
    
}
