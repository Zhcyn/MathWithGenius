//
//  CascadingTableViewCell.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 25/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class CascadingTableViewCell: UITableViewCell {

    @IBOutlet weak var cellBackground: UIView!
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
        
        cellLabel.tintColor = UIColor.Reds.gryffindorRed
        cellLabel.numberOfLines = 0
        cellLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        cellLabel.textColor = UIColor.Yellows.gryffindorYellow
        cellBackground.backgroundColor = UIColor.Reds.gryffindorRed
    }
    
    override func prepareForReuse() {
        cellLabel.text = ""
    }

    
}
