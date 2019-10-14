//
//  IntroductionCell.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class IntroductionCell: UITableViewCell {
    
    fileprivate var mainModel = MainModel()
    
    @IBOutlet weak var cellBackground: UIView!
    @IBOutlet weak var courseTitle: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func config(indexPath: Int) {
        courseTitle.setTitle(mainModel.courseTitles[indexPath], for: .normal)
        cellBackground.backgroundColor = UIColor.Shades.standardBlack
        courseTitle.backgroundColor = UIColor.Reds.gryffindorRed
        courseTitle.setTitleColor(UIColor.Yellows.gryffindorYellow, for: .normal)
        DispatchQueue.main.async { [weak self] in
            self?.courseTitle.roundCorners(for: .allCorners, cornerRadius: 8)
        }
        
    }
    
    @IBAction func courseTitle(_ sender: Any) {
    }
}
