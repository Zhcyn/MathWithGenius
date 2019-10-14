//
//  EquationFlowController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 20/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class EquationFlowController {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //Factory of view to show
    func showMain() {
        MainFactory.PushIn(navigationController: navigationController)
    }

    func showHelpScreen(firstNumber: Int, secondNumber: Int, subject: String) {
        HelpScreenFactory.PushIn(navigationController: navigationController, firstNumber: firstNumber, secondNumber: secondNumber, subject: subject)
    }
    
}
