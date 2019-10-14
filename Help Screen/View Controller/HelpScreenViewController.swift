//
//  HelpScreen.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 30/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import UIKit

class HelpScreenViewController: UIViewController, HelpSectionSelectedDelegate {
    
    fileprivate var helpScreenFlowController: HelpScreenFlowController!
    fileprivate var helpScreenViewModel: HelpScreenViewModel!
    fileprivate var helpScreenModel = HelpScreenModel()
    
    var firstNumber = Int()
    var secondNumber = Int ()
    var subject = String()
    var helpTitle = String()

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var customTable: CustomTable!
    

    func assignDependancies(helpScreenFlowController: HelpScreenFlowController, helpScreenViewModel: HelpScreenViewModel) {
    self.helpScreenViewModel = helpScreenViewModel
    self.helpScreenFlowController = helpScreenFlowController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        customTable.cellDelegate = self
    }
    
    func setUp() {
        
        firstNumber = helpScreenViewModel.firstNumber
        secondNumber = helpScreenViewModel.secondNumber
        subject = helpScreenViewModel.subject
        
        self.title = "How to..."
        self.view.backgroundColor = UIColor.Shades.standardBlack
        
        titleLabel.text = "Select the help item below..."
        titleLabel.subTitleLabelSetUp()
        
        tableSetUp()
    }
    
    func tableSetUp() {
        customTable.backgroundColor = UIColor.Shades.standardBlack
        
        if subject == SubjectType.Additions.name() {
            customTable.customCellsData = HelpSubject.Additions.allCases.map { $0.rawValue }
        } else if subject == SubjectType.Subtractions.name() {
            customTable.customCellsData = HelpSubject.Subtractions.allCases.map { $0.rawValue }
        } else if subject == SubjectType.Multiplications.name() {
            customTable.customCellsData = HelpSubject.Multiplications.allCases.map { $0.rawValue }
        } else if subject == SubjectType.Divisions.name() {
            customTable.customCellsData = HelpSubject.Divisions.allCases.map { $0.rawValue }
        }
        
    }


    func cellWasSelected(id: Int, title: String) {
        
        helpTitle = title
        
        helpScreenFlowController.equationHelp(firstNumber: firstNumber, secondNumber: secondNumber, subject: subject, helpTitle: helpTitle)

    }
}
