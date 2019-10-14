//
//  EquationFactory.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 20/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class EquationFactory {
    
    static func PushIn(navigationController: UINavigationController, firstNumber: Int, secondNumber: Int, subject: String) {
        
        let storyBoard = UIStoryboard(name: "Equation", bundle: nil).instantiateInitialViewController() as! EquationViewController
        let flowController = EquationFlowController(navigationController: navigationController)
        let viewModel = EquationViewModel(firstNumber: firstNumber, secondNumber: secondNumber, subject: subject)
        
        storyBoard.assignDependancies(equationFlowController: flowController, equationViewModel: viewModel)
        
        
        navigationController.pushViewController(storyBoard, animated: true)
        
    }

}
