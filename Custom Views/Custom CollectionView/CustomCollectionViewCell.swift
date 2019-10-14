//
//  CustomCollectionViewCell.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 18/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellBackground: UIView!
    
    @IBOutlet weak var cellLabel: UILabel!
    
    @IBOutlet weak var cellImage: UIImageView!

    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundView?.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.numberOfLines = 0
        


    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 0))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.cellLabel.text = nil
    }
    
}
