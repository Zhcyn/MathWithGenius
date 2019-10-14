//
//  numberSelectionFactory.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class NumberSelectionFactory {
    
    static func PushIn(navigationController: UINavigationController, subject: String) {
        
        let numberSelection = UIStoryboard(name: "NumberSelection", bundle: nil).instantiateInitialViewController() as! NumberSelectionViewController
        let numberSelectionFlowController = NumberSelectionFlowController(navigationController: navigationController)
        let numberSelectionViewModel = NumberSelectionViewModel(subject: subject)
        
        numberSelection.assignDependancies(numberSelectionFlowController: numberSelectionFlowController, numberSelectionViewModel: numberSelectionViewModel)
        
        navigationController.pushViewController(numberSelection, animated: true)
        
    }
    
}
