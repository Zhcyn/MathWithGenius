//
//  HelpScreenFlowController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 30/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class HelpScreenFlowController {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showMain() {
        MainFactory.PushIn(navigationController: navigationController)
    }

    func equationHelp(firstNumber: Int, secondNumber: Int, subject: String, helpTitle: String) {
        EquationHelpFactory.PushIn(navigationController: navigationController, firstNumber: firstNumber, secondNumber: secondNumber, subject: subject, helpTitle: helpTitle)
    }
}
