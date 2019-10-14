//
//  HelpScreenModel.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 05/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class HelpScreenModel {
    
    let additionsSectionTitles = ["Use your fingers", "Section2", "Section3"]
    
    let additionsCellTitle = ["If the number is small enough, you may use your fingers, or pencils, or any other item you have handy. /n Count the number of pencils for the first number and then count the number of pencils for the second number /n Now count all of the pencils together. This is your answer.", "Cell2", "Cell3"]
}


func prv() -> Void {
    print ("item1")
}

func main2() -> Void {
    print ("item 2")
}

enum additionsHelp {
    case usingPlaceValues
    case main
    
    static let allValues = [usingPlaceValues, main]
    
    func gotoPage()-> Void {
        switch self {
        case .usingPlaceValues:
            prv()
        case .main:
            main2()
        }
    }
}


