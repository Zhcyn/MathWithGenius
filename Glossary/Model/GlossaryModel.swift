//
//  GlossaryModel.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 25/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit
class GlossaryModel {
    
    var item: String
    var alsoKnownAs: String?
    var deffinition: String
    var definition2: String?
    
    init (item: String, alsoKnownAs: String?, deffinition: String, definition2: String?) {
        self.item = item
        self.alsoKnownAs = alsoKnownAs
        self.deffinition = deffinition
        self.definition2 = definition2
    }
    
    var glossaryArray = [GlossaryModel]()
}
