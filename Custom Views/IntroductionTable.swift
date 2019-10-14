//
//  IntroductionTable.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class IntroductionTable: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    fileprivate var mainModel = MainModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        delegate = self
        dataSource = self
        
        //setup custom cell
        self.register(UINib(nibName: "IntroductionCell", bundle: nil), forCellReuseIdentifier: "introductionCell")
        self.estimatedRowHeight = 100
        self.rowHeight = UITableView.automaticDimension
        
        //hide unused rows
        self.tableFooterView = UIView()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainModel.courseTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "introductionCell", for: indexPath) as! IntroductionCell
        cell.config(indexPath: indexPath.row)
        return cell
    }
    

    
}
