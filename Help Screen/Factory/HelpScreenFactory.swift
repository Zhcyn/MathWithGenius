//
//  HelpScreenFactory.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 30/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class HelpScreenFactory {
    
    static func PushIn(navigationController: UINavigationController, firstNumber: Int, secondNumber: Int, subject: String) {
        
        let helpScreen = UIStoryboard(name: "HelpScreen", bundle: nil).instantiateInitialViewController() as! HelpScreenViewController
        let helpScreenFlowController = HelpScreenFlowController(navigationController: navigationController)
        let helpScreenViewModel = HelpScreenViewModel(firstNumber: firstNumber, secondNumber: secondNumber, subject: subject)
        
        helpScreen.assignDependancies(helpScreenFlowController: helpScreenFlowController, helpScreenViewModel: helpScreenViewModel)

        
        navigationController.pushViewController(helpScreen, animated: true)
        
    }
    
}
