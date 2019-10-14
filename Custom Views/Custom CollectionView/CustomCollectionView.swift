//
//  CustomCollectionView.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 17/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class CustomCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource{

    
    
    var cellData: [String] = ["cell1", "cell2"]
    var cellImage: [UIImage] = []

    
    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.size.width - 10
        layout.estimatedItemSize = CGSize(width: width, height: 900)
        return layout
    }()
    
    override func awakeFromNib() {
        delegate = self
        dataSource = self
        self.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")

        
        self.collectionViewLayout = layout
        
        print ("celldata count = \(cellData.count)")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        

        
        if indexPath.item > cellImage.count - 1 {
            cell.backgroundView?.backgroundColor = UIColor.Greens.seaGreen
            cell.cellLabel.text = cellData[indexPath.row]
            cell.cellImage.image = nil
            
            cell.cellBackground.backgroundColor = UIColor.Yellows.gryffindorYellow
            cell.cellLabel.textColor = UIColor.Reds.gryffindorRed
            cell.cellLabel.textAlignment = .center
        
            return cell
        } else {
            
            cell.cellLabel.text = cellData[indexPath.row]
            cell.cellImage.image = cellImage[indexPath.row]
        
            cell.cellBackground.backgroundColor = UIColor.Shades.standardBlack
            cell.cellLabel.textColor = UIColor.Shades.standardWhite
            cell.cellLabel.textAlignment = .left

        return cell
        }
        
        
    }
}
