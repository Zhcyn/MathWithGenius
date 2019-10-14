//
//  CascadingTableHeader.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 30/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class CascadingTableHeader: UITableViewHeaderFooterView {
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    
    
    func config() {
        
        labelTitle.tintColor = UIColor.Reds.gryffindorRed
        labelTitle.numberOfLines = 0
        labelTitle.lineBreakMode = NSLineBreakMode.byWordWrapping
        labelTitle.textColor = UIColor.Yellows.gryffindorYellow
        background.backgroundColor = UIColor.Reds.gryffindorRed
    }
    
    override func prepareForReuse() {
        labelTitle.text = ""
    }

}
