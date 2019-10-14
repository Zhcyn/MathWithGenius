//
//  NumberPad.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 16/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class NumberPad: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var key1: UIButton!
    @IBOutlet weak var key2: UIButton!
    @IBOutlet weak var key3: UIButton!
    @IBOutlet weak var key4: UIButton!
    @IBOutlet weak var key5: UIButton!
    @IBOutlet weak var key6: UIButton!
    @IBOutlet weak var key7: UIButton!
    @IBOutlet weak var key8: UIButton!
    @IBOutlet weak var key9: UIButton!
    @IBOutlet weak var key0: UIButton!

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        numberPadInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        numberPadInit()
    }
    
    private func numberPadInit() {
        self.layer.cornerRadius = 8
        Bundle.main.loadNibNamed("NumberPad", owner: self, options: nil)
        addSubview(contentView)
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
//        keyPadBackground.isUserInteractionEnabled = true
//        keyPadBackground.layer.shadowRadius = 5
//        keyPadBackground.layer.shadowOpacity = 0.8
//        keyPadBackground.layer.shadowOffset = CGSize(width: 5, height: 5)
    }
    
}



//for number button *********

//override init(frame: CGRect) {
//    super.init(frame: frame)
//    numberButtonInit()
//}
//required init?(coder aDecoder: NSCoder) {
//    super.init(coder: aDecoder)
//    numberButtonInit()
//}
//
//private func numberButtonInit() {
//    self.layer.cornerRadius = 8
//    Bundle.main.loadNibNamed("NumberButton", owner: self, options: nil)
//    addSubview(numberButton)
//    numberButton.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//    numberButton.layer.cornerRadius = 8
//    numberButton.layer.masksToBounds = true
//    numberButton.isUserInteractionEnabled = true
//    numberButton.layer.shadowRadius = 5
//    numberButton.layer.shadowOpacity = 0.8
//    numberButton.layer.shadowOffset = CGSize(width: 5, height: 5)
//}

