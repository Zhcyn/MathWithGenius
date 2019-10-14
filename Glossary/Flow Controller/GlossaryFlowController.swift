//
//  GlossaryFlowController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 25/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class GlossaryFlowController {
      let navigationController: UINavigationController
        
        init(navigationController: UINavigationController) {
            self.navigationController = navigationController
        }
        
    //Factory of view to show
        func showMain() {
            MainFactory.PushIn(navigationController: navigationController)
        }

}
