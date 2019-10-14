//
//  CustomTableCell.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 06/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class CustomTableCell: UITableViewCell {

    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        
        cellBackground.backgroundColor = UIColor.Reds.gryffindorRed
        cellLabel.textColor = UIColor.Yellows.gryffindorYellow
        cellImageView.image = UIImage(named: "wand")
    }
    
}
