//
//  CustomTable.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 06/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

protocol HelpSectionSelectedDelegate {
    func cellWasSelected(id: Int, title: String)

}

class CustomTable: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var customCellsData: [String] = []
    
    var cellDelegate: HelpSectionSelectedDelegate?
    
    override func awakeFromNib() {
        dataSource = self
        delegate = self
        
        //register custom cell
        self.register(UINib(nibName: "CustomTableCell", bundle: nil), forCellReuseIdentifier: "customTableCell")
        
        //hide unused rows
        self.tableFooterView = UIView()

    }
    
    //set number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customCellsData.count
    }
    
    //setup the cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableCell", for: indexPath) as! CustomTableCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.blue
        cell.cellLabel.text = customCellsData[indexPath.row]
        cell.config()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //when cell selected send inder row to view controller
        cellDelegate?.cellWasSelected(id: indexPath.row, title: customCellsData[indexPath.row])
    }

}
