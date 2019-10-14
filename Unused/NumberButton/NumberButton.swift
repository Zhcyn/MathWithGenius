//
//  NumberButton.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 16/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class NumberButton: UIButton {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var numberButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        numberButtonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        numberButtonInit()
    }
    
    private func numberButtonInit() {
        self.layer.cornerRadius = 8
        Bundle.main.loadNibNamed("NumberButton", owner: self, options: nil)
        addSubview(contentView)
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.isUserInteractionEnabled = false
        
        numberButton.backgroundColor = UIColor.Shades.standardGrey
        numberButton.layer.shadowRadius = 50
        numberButton.layer.shadowOpacity = 0.8
        numberButton.layer.shadowOffset = CGSize(width: 5, height: 5)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
