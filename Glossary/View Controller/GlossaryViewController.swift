//
//  GlossaryViewController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 25/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class GlossaryViewController: UIViewController {
    
    fileprivate var glossaryFlowController: GlossaryFlowController!
    fileprivate var glossaryViewModel: GlossaryViewModel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cascadingTable: CascadingTable!
    
    func assignDependancies(glossaryFlowController: GlossaryFlowController, glossaryViewModel: GlossaryViewModel) {
        self.glossaryViewModel = glossaryViewModel
        self.glossaryFlowController = glossaryFlowController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenSetUp()
        titleLabelSetup()
        glossaryItemsSetup()
    }
    
    func screenSetUp() {
        self.title = "GLOSSARY"
        self.view.backgroundColor = UIColor.Shades.standardBlack
    }
    
    func titleLabelSetup() {
        titleLabel.text = "Touch the name to view the description..."
        titleLabel.titleLabelSetUp()
    }
    
    func glossaryItemsSetup() {
        
        //Run func to add glossary items to array
        glossaryViewModel.arrayOfGlossary()
        
        //sort array alphabeticaly and then add to table sections and cells
        for i in glossaryViewModel.glossaryArray.sorted(by: { $0.item < $1.item}) {
            cascadingTable.tableSectionName.append(i.item)
            
            //Only add non empty fields to cells
            if i.alsoKnownAs != nil && i.definition2 != nil {
                cascadingTable.tableCellData.append([i.alsoKnownAs, i.deffinition, i.definition2])
            }
            
            if i.alsoKnownAs != nil && i.definition2 == nil {
                cascadingTable.tableCellData.append([i.alsoKnownAs, i.deffinition])
            }
            
            if i.alsoKnownAs == nil && i.definition2 == nil {
                cascadingTable.tableCellData.append([i.deffinition])
            }
        }
    }
}
