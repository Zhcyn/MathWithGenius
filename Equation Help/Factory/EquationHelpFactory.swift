//
//  EquationHelpFactory.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 20/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class EquationHelpFactory {
 
    static func PushIn(navigationController: UINavigationController, firstNumber: Int, secondNumber: Int, subject: String, helpTitle: String) {
        
        let storyBoard = UIStoryboard(name: "EquationHelp", bundle: nil).instantiateInitialViewController() as! EquationHelpViewController
        let flowController = EquationHelpFlowController(navigationController: navigationController)
        let viewModel = EquationHelpViewModel(firstNumber: firstNumber, secondNumber: secondNumber, subject: subject, helpTitle: helpTitle)
        
        storyBoard.assignDependancies(equationHelpFlowController: flowController, equationHelpViewModel: viewModel)
        
        
        navigationController.pushViewController(storyBoard, animated: true)
        
    }
    
}
