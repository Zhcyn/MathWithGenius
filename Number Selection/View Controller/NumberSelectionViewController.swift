//
//  NumberSelectionViewController.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 09/08/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation
import UIKit



class NumberSelectionViewController: UIViewController {
    
    fileprivate var numberSelectionViewModel: NumberSelectionViewModel!
    fileprivate var numberSelectionFlowController: NumberSelectionFlowController!
    
    var subject = String()
    var firstNumber = Int()
    var secondNumber = Int()
    
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    @IBOutlet weak var firstNumberOutcome: UILabel!
    @IBOutlet weak var secondNumberOutcome: UILabel!
    @IBOutlet weak var firstNumberSelector: UISegmentedControl!
    @IBOutlet weak var secondNumberSelector: UISegmentedControl!
    @IBOutlet weak var continueButton: UIButton!
    
    func assignDependancies(numberSelectionFlowController: NumberSelectionFlowController, numberSelectionViewModel: NumberSelectionViewModel){
        self.numberSelectionFlowController = numberSelectionFlowController
        self.numberSelectionViewModel = numberSelectionViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set subject name from button push on previouse page
        subject = numberSelectionViewModel.subject
        
        setUp()
    }
    
    func setUp() {
        firstNumberLabel.bodyLabelSetUp()
        secondNumberLabel.bodyLabelSetUp()
        firstNumberLabel.text = "Select how large you would like the first number in the equasion"
        secondNumberLabel.text = "Select how large you would like the first number in the equasion"
        
        firstNumberOutcome.bodyLabelSetUp()
        secondNumberOutcome.bodyLabelSetUp()
        
        continueButton.subTitleButtonSetup()
        continueButton.setTitle("Continue to \(subject)", for: .normal)
        
        self.view.backgroundColor = UIColor.Shades.standardBlack
        self.title = "Number selection"
        
        //disable selector and button to force pick order
        secondNumberSelector.isEnabled = false
        
        firstNumberSelector.backgroundColor = UIColor.Yellows.gryffindorYellow
        secondNumberSelector.backgroundColor = UIColor.Yellows.gryffindorYellow
        
        continueButton.disableButton()
    }
    
    @IBAction func firstNumberSelector(_ sender: Any) {
        
        //Disable button to force a second number selection
        continueButton.disableButton()

        //enable all segments in secondnumberselector
        for i in 0...3 {
            secondNumberSelector.setEnabled(true, forSegmentAt: i)
        }
        secondNumberSelector.isEnabled = true
        
        //random number for selection
        switch firstNumberSelector.selectedSegmentIndex
        {
        case 0:
            firstNumberOutcome.text = "You have selected Thousands for your first number. \n This means your first number will be between 1000 and 9999"
            firstNumber = Int.random(in: 1000...9999)
        case 1:
            firstNumberOutcome.text = "You have selected Hundreds for your first number. \n This means your first number will be between 100 and 999"
            firstNumber = Int.random(in: 100...999)
        case 2:
            firstNumberOutcome.text = "You have selected Tens for your first number. \n This means your first number will be between 10 and 99"
            firstNumber = Int.random(in: 10...99)
        case 3:
            firstNumberOutcome.text = "You have selected Units for your first number. \n This means your first number will be between 1 and 9"
            firstNumber = Int.random(in: 1...9)
        default:
            break
        }
        
        if (subject == SubjectType.Subtractions.name() || subject == SubjectType.Divisions.name()) && firstNumberSelector.selectedSegmentIndex > 0 {
            for i in 1...self.firstNumberSelector.selectedSegmentIndex {
                //unselect segments in seconNumberSelector
                secondNumberSelector.selectedSegmentIndex = UISegmentedControl.noSegment
                secondNumberOutcome.text = ""
                
                self.secondNumberSelector.setEnabled(false, forSegmentAt: i - 1)
            }
        }
    }
    @IBAction func secondNumberSelector(_ sender: Any) {
        
        switch secondNumberSelector.selectedSegmentIndex
        {
        case 0:
            secondNumberOutcome.text = "You have selected Thousands for your second number. \n This means your second number will be between 1000 and 9999"
            
            if subject == SubjectType.Subtractions.name() && firstNumberSelector.selectedSegmentIndex == secondNumberSelector.selectedSegmentIndex {
                secondNumber = Int.random(in: 1000...firstNumber)
            } else if subject == SubjectType.Divisions.name() {
                secondNumber = firstNumber.randomDivisable(lowerLimit: 1000, upperLimit: 9999)
            }else {
                secondNumber = Int.random(in: 1000...9999)
            }
            
        case 1:
            secondNumberOutcome.text = "You have selected Hundreds for your second number. \n This means your second number will be between 100 and 999"
            
            if (subject == SubjectType.Subtractions.name() || subject == SubjectType.Divisions.name()) && firstNumberSelector.selectedSegmentIndex == secondNumberSelector.selectedSegmentIndex {
                secondNumber = Int.random(in: 100...firstNumber)
            } else if subject == SubjectType.Divisions.name() {
                secondNumber = firstNumber.randomDivisable(lowerLimit: 100, upperLimit: 999)
            }else {
                secondNumber = Int.random(in: 100...999)
            }
            
        case 2:
            secondNumberOutcome.text = "You have selected Tens for your second number. \n This means your second number will be between 10 and 99"
            
            if (subject == SubjectType.Subtractions.name() || subject == SubjectType.Divisions.name()) && firstNumberSelector.selectedSegmentIndex == secondNumberSelector.selectedSegmentIndex {
                secondNumber = Int.random(in: 10...firstNumber)
            } else if subject == SubjectType.Divisions.name() {
                secondNumber = firstNumber.randomDivisable(lowerLimit: 10, upperLimit: 99)
            }else {
                secondNumber = Int.random(in: 10...99)
            }

        case 3:
            secondNumberOutcome.text = "You have selected Units for your second number. \n This means your second number will be between 1 and 9"
            
            if subject == SubjectType.Subtractions.name() && firstNumberSelector.selectedSegmentIndex == secondNumberSelector.selectedSegmentIndex {
                secondNumber = Int.random(in: 1...firstNumber)
            } else if subject == SubjectType.Divisions.name() {
                secondNumber = firstNumber.randomDivisable(lowerLimit: 1, upperLimit: 9)
            } else {
                self.secondNumber = Int.random(in: 1...9)
            }
            

        default:
            break
        }
        
        //enable button to proceed to next page
        continueButton.enableButton()
    }
    
    @IBAction func continueButton(_ sender: Any) {
        
        numberSelectionFlowController.showEquation(firstNumber: firstNumber, secondNumber: secondNumber, subject: subject)
        

        
    }
    
}
//
//if firstNumber.digits.sum() == 1 {
//     secondNumber = 1
// } else if firstNumber.digits.sum() == 2 {
//     secondNumber = [1, 2].randomElement()!
// } else if firstNumber.digits.sum() == 3 {
//     secondNumber = [1, 3].randomElement()!
// } else if firstNumber == 4 {
//     secondNumber = [1, 2, 4].randomElement()!
// } else if firstNumber.digits.sum() == 5 {
//     secondNumber = [1, 5].randomElement()!
// } else if firstNumber.digits.sum() == 6 {
//     secondNumber = [1, 2, 3, 6].randomElement()!
// } else if firstNumber.digits.sum() == 7 {
//     secondNumber = [1, 7].randomElement()!
// } else if firstNumber.digits.sum() == 8 {
//     secondNumber = [1, 2, 4, 8].randomElement()!
// } else if firstNumber.digits.sum() == 9 {
//
