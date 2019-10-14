//
//  GlossaryFactory.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 25/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class GlossaryFactory {
    static func PushIn(navigationController: UINavigationController) {
        
        let storyBoard = UIStoryboard(name: "Glossary", bundle: nil).instantiateInitialViewController() as! GlossaryViewController
        let flowController = GlossaryFlowController(navigationController: navigationController)
        let viewModel = GlossaryViewModel()
        
        storyBoard.assignDependancies(glossaryFlowController: flowController, glossaryViewModel: viewModel)
        
        
        navigationController.pushViewController(storyBoard, animated: true)
        
    }

}
