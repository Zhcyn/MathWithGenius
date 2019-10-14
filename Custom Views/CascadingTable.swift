//
//  CascadingTable.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 30/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit

class CascadingTable: UITableView, UITableViewDelegate, UITableViewDataSource {
    
//    fileprivate var dailyTaskViewModel = DailyTaskViewModel()
    
    override func awakeFromNib() {
        delegate = self
        dataSource = self
        
        //Stop selection of rows
        self.allowsSelection = false
        
        //hide unused rows
        self.tableFooterView = UIView()
        
        //call custom header
        let headerNib = UINib.init(nibName: "CascadingTableHeader", bundle: Bundle.main)
        self.register(headerNib, forHeaderFooterViewReuseIdentifier: "CascadingTableHeader")
        
        self.backgroundColor = UIColor.Reds.gryffindorRed
        
    }
    
    var tableCellData: [Any] = []
    var tableSectionName: [Any] = []
    
    private var sectionTouched: Int?
    
    //Sets which section to show open on first view (set -1 for all closed)
    private var expandedSectionHeaderNumber: Int = -1
    
    let headerSectionTag: Int = 1
    
    //Number of section required for table
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return tableSectionName.count
    }
    
    //Number of rows for each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.expandedSectionHeaderNumber == section) {
            let arrayOfItems = self.tableCellData[section] as! NSArray
            return arrayOfItems.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CascadingTableHeader") as! CascadingTableHeader
        
        headerView.labelTitle.text = self.tableSectionName[section] as? String
        headerView.labelTitle.font = UIFont.boldSystemFont(ofSize: 25)
        headerView.config()
        
        headerView.imageView.image = UIImage(named: "chevron")
        headerView.imageView.tag = headerSectionTag + section
        
        headerView.tag = section
        let headerTapGesture = UITapGestureRecognizer()
        headerTapGesture.addTarget(self, action: #selector(self.sectionHeaderWasTouched(_:)))
        headerView.addGestureRecognizer(headerTapGesture)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GlossaryCell", for: indexPath) as UITableViewCell
        let section = self.tableCellData[indexPath.section] as! NSArray
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textColor = UIColor.Reds.gryffindorRed
        cell.backgroundColor = UIColor.Yellows.gryffindorYellow
        cell.textLabel?.text = section[indexPath.row] as? String
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print ("clicked cell \(indexPath)")
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    @objc func sectionHeaderWasTouched(_ sender: UITapGestureRecognizer) {
        let headerView = sender.view as! CascadingTableHeader
        let section    = headerView.tag
        let eImageView = headerView.viewWithTag(headerSectionTag + section) as? UIImageView
        sectionTouched = section
        
        //If section header is colapsed expand section
        if self.expandedSectionHeaderNumber == -1 {
            self.expandedSectionHeaderNumber = section
            tableViewExpandSection(section, imageView: eImageView!)
            self.scrollToBottomRow()
        } else { //if section header is open the colapse it
            if self.expandedSectionHeaderNumber == section {
                tableViewCollapeSection(section, imageView: eImageView!)
            } else { //if header section is colapsed but another header is expanded, colapse open section and expand section header
                let cImageView = self.viewWithTag(headerSectionTag + self.expandedSectionHeaderNumber) as? UIImageView
                tableViewCollapeSection(self.expandedSectionHeaderNumber, imageView: cImageView!)
                tableViewExpandSection(section, imageView: eImageView!)
            }
        }
    }
    
    //Hide open cells when table is scrolled
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if self.expandedSectionHeaderNumber != -1 {
            guard let image = self.viewWithTag(headerSectionTag + sectionTouched!) as? UIImageView else { return print ("No image") }
            tableViewCollapeSection(sectionTouched!, imageView: image)
        }
        
    }
    
    func tableViewCollapeSection(_ section: Int, imageView: UIImageView) {
        let sectionData = self.tableCellData[section] as! NSArray
        //set variable back to -1 so "expanded section is not on a visable section"
        self.expandedSectionHeaderNumber = -1
        if sectionData.count == 0 {
            return
        } else {
            //turn chevron around
            UIView.animate(withDuration: 0.4, animations: {
                imageView.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(Double.pi)) / 180.0)
            })
            var indexesPath = [IndexPath]()
            for i in 0 ..< sectionData.count {
                let index = IndexPath(row: i, section: section)
                indexesPath.append(index)
            }
            self.deleteRows(at: indexesPath, with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableViewExpandSection(_ section: Int, imageView: UIImageView) {
        let sectionData = self.tableCellData[section] as! NSArray
        
        if (sectionData.count == 0) {
            self.expandedSectionHeaderNumber = -1
            return
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                imageView.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(Double.pi)) / 180.0)
            })
            var indexesPath = [IndexPath]()
            for index in 0 ..< sectionData.count {
                let index = IndexPath(row: index, section: section)
                indexesPath.append(index)
            }
            self.expandedSectionHeaderNumber = section
            self.insertRows(at: indexesPath, with: UITableView.RowAnimation.none)
        }
    }
    
    func reloadTableView(_ tableView: UITableView) {
        let contentOffset = self.contentOffset
        self.reloadData()
        self.layoutIfNeeded()
        self.setContentOffset(contentOffset, animated: false)
    }
}

////
////  CascadingTable.swift
////  Maths Genius
////
////  Created by Carl Wainwright on 30/08/2019.
////  Copyright © 2019 Carl Wainwright. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class CascadingTable: UITableView, UITableViewDelegate, UITableViewDataSource {
//
//    override func awakeFromNib() {
//        delegate = self
//        dataSource = self
//
//        //Stop selection of rows
//        self.allowsSelection = false
//
//        //hide unused rows
//        self.tableFooterView = UIView()
//
//        //call custom header
//        let headerNib = UINib.init(nibName: "CascadingTableHeader", bundle: Bundle.main)
//        self.register(headerNib, forHeaderFooterViewReuseIdentifier: "CascadingTableHeader")
//
//        let cellNib = UINib.init(nibName: "CascadingTableViewCell", bundle: Bundle.main)
//        self.register(cellNib, forCellReuseIdentifier: "CascadingTableViewCell")
//
//
//    }
//
//
//    var tableCellData: [String] = []
//    var tableSectionName: [String] = []
//
//    private var sectionTouched: Int?
//    //Sets section -1 so all table is colapsed
//    private var expandedSectionHeaderNumber: Int = -1
//
//    let headerSectionTag: Int = 1
//
//    //Number of section required for table
//    func numberOfSections(in tableView: UITableView) -> Int {
//
//        return tableSectionName.count
//    }
//
//    //Number of rows for each section
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if (self.expandedSectionHeaderNumber == section) {
//            let arrayOfItems = self.tableCellData[section]
//            return arrayOfItems.count
//        } else {
//            return 0
//        }
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CascadingTableHeader") as! CascadingTableHeader
//
//        headerView.labelTitle.text = self.tableSectionName[section]
//        headerView.config()
//
//        headerView.imageView.image = UIImage(named: "chevron")
//        headerView.imageView.tag = headerSectionTag + section
//
//        headerView.tag = section
//        let headerTapGesture = UITapGestureRecognizer()
//        headerTapGesture.addTarget(self, action: #selector(self.sectionHeaderWasTouched(_:)))
//        headerView.addGestureRecognizer(headerTapGesture)
//
//        return headerView
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CascadingTableViewCell", for: indexPath) as! CascadingTableViewCell
//
//
//
////
//        let section = self.tableCellData[indexPath.section]
//////        let completeTask = self.taskCompletetion[indexPath.section] as! NSArray
////        cell.textLabel?.text = section[indexPath.row]
//
//        print ("index patch - row \(indexPath.row) section = \(indexPath.section)")
//
//
//        cell.cellLabel.text = section
//
////        cell.cellLabel.text = tableCellData[indexPath.section]
//
//        cell.textLabel?.textColor = UIColor.black
//        cell.backgroundColor = UIColor.Greens.standardGreen
//
////        if completeTask[indexPath.row] as! Bool == false {
////            cell.backgroundColor = UIColor.Reds.standardRed
////        }
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//
//    @objc func sectionHeaderWasTouched(_ sender: UITapGestureRecognizer) {
//        let headerView = sender.view as! CascadingTableHeader
//        let section    = headerView.tag
//        let eImageView = headerView.viewWithTag(headerSectionTag + section) as? UIImageView
//        sectionTouched = section
//
//        //If section header is colapsed expand section
//        if self.expandedSectionHeaderNumber == -1 {
//            self.expandedSectionHeaderNumber = section
//            tableViewExpandSection(section, imageView: eImageView!)
//            self.scrollToBottomRow()
//        } else { //if section header is open the colapse it
//            if self.expandedSectionHeaderNumber == section {
//                tableViewCollapeSection(section, imageView: eImageView!)
//            } else { //if header section is colapsed but another header is expanded, colapse open section and expand section header
//                let cImageView = self.viewWithTag(headerSectionTag + self.expandedSectionHeaderNumber) as? UIImageView
//                tableViewCollapeSection(self.expandedSectionHeaderNumber, imageView: cImageView!)
//                tableViewExpandSection(section, imageView: eImageView!)
//            }
//        }
//    }
//
//    //Hide open cells when table is scrolled
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        if self.expandedSectionHeaderNumber != -1 {
//            guard let image = self.viewWithTag(headerSectionTag + sectionTouched!) as? UIImageView else { return print ("No image") }
//            tableViewCollapeSection(sectionTouched!, imageView: image)
//        }
//
//    }
//
//    func tableViewCollapeSection(_ section: Int, imageView: UIImageView) {
//        let sectionData = self.tableCellData[section]
//        //set variable back to -1 so "expanded section is not on a visable section"
//        self.expandedSectionHeaderNumber = -1
//        if sectionData.count == 0 {
//            return
//        } else {
//            //turn chevron around
//            UIView.animate(withDuration: 0.4, animations: {
//                imageView.transform = CGAffineTransform(rotationAngle: (0.0 * CGFloat(Double.pi)) / 180.0)
//            })
//            var indexesPath = [IndexPath]()
//            for i in 0 ..< sectionData.count {
//                let index = IndexPath(row: i, section: section)
//                indexesPath.append(index)
//            }
//            self.deleteRows(at: indexesPath, with: UITableView.RowAnimation.fade)
//        }
//    }
//
//    func tableViewExpandSection(_ section: Int, imageView: UIImageView) {
//        let sectionData = self.tableCellData[section]
//
//        if (sectionData.count == 0) {
//            self.expandedSectionHeaderNumber = -1
//            return
//        } else {
//            UIView.animate(withDuration: 0.4, animations: {
//                imageView.transform = CGAffineTransform(rotationAngle: (180.0 * CGFloat(Double.pi)) / 180.0)
//            })
//            var indexesPath = [IndexPath]()
//            for index in 0 ..< sectionData.count {
//                let index = IndexPath(row: index, section: section)
//                indexesPath.append(index)
//            }
//            self.expandedSectionHeaderNumber = section
//            self.insertRows(at: indexesPath, with: UITableView.RowAnimation.none)
//        }
//    }
//
//    func reloadTableView(_ tableView: UITableView) {
//        let contentOffset = self.contentOffset
//        self.reloadData()
//        self.layoutIfNeeded()
//        self.setContentOffset(contentOffset, animated: false)
//    }
//}
//
