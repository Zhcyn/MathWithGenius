//
//  GlossaryViewModel.swift
//  Maths Genius
//
//  Created by Carl Wainwright on 25/09/2019.
//  Copyright © 2019 Carl Wainwright. All rights reserved.
//

import Foundation

class GlossaryViewModel {
    
    var glossaryArray = [GlossaryModel]()
    
    func arrayOfGlossary() {
        
        glossaryArray.append((GlossaryModel(item: "Add +", alsoKnownAs: "Also known as - Addition or Plus", deffinition: "Adding two or more numbers together to make a new number", definition2: nil)))
        
        glossaryArray.append(GlossaryModel(item: "Subtract  -", alsoKnownAs: "Also known as - Subtraction, Minus or Take Away", deffinition: "Take one number away from another to make a new number", definition2: nil))
        
        glossaryArray.append(GlossaryModel(item: "Multiply ×", alsoKnownAs: "Also known as - Multiplication or Times", deffinition: "Repeatedly adding a number to another to make a new number", definition2: nil))
        
        glossaryArray.append(GlossaryModel(item: "Divide ÷", alsoKnownAs: "Also known as - Division", deffinition: "Using a number to split another number into equal parts", definition2: nil))
        
        glossaryArray.append(GlossaryModel(item: "Unit", alsoKnownAs: "Also known as Ones", deffinition: "The rightmost position in any number. This is the number that is form 0 - 9", definition2: nil))
        
        glossaryArray.append(GlossaryModel(item: "Tens", alsoKnownAs: nil, deffinition: "The number in the second position to the left of the unit. For example in 73 the 7 is the Tens number", definition2: nil))
        
        glossaryArray.append(GlossaryModel(item: "Hundreds", alsoKnownAs: nil, deffinition: "The number in the third position to the left of the unit. For example in 973 the 9 is the Hundreds number", definition2: nil))
        
        glossaryArray.append(GlossaryModel(item: "Thousands", alsoKnownAs: nil, deffinition: "The number in the fourth position to the left of the unit. For example in 8973 the 8 is the Thousands number", definition2: nil))
        
        glossaryArray.append(GlossaryModel(item: "More Than >", alsoKnownAs: "Greater Than", deffinition: "This symbol denote the number on the laft side is larger than the number on the right side. For example 6 > 2", definition2: nil))
        
        glossaryArray.append(GlossaryModel(item: "Less Than <", alsoKnownAs: "Smaller than", deffinition: "This symbol denote the number on the laft side is smaller than the number on the right side. For example 2 < 6", definition2: nil))
        
        glossaryArray.append(GlossaryModel(item: "Equals =", alsoKnownAs: "Also known as The Sum", deffinition: "This symbol is used used to ask what the sum of two numbers are. For example 2 + 2 =", definition2: "This symbol is also used to show one number is equal to another. For example 2 = 2 or 1 + 1 = 2"))
        
//        glossaryArray.append(GlossaryModel(item: <#String#>, alsoKnownAs: <#String?#>, deffinition: <#String#>, definition2: <#String?#>))
//        
//        glossaryArray.append(GlossaryModel(item: <#String#>, alsoKnownAs: <#String?#>, deffinition: <#String#>, definition2: <#String?#>))
//        
//        glossaryArray.append(GlossaryModel(item: <#String#>, alsoKnownAs: <#String?#>, deffinition: <#String#>, definition2: <#String?#>))
//        
//        glossaryArray.append(GlossaryModel(item: <#String#>, alsoKnownAs: <#String?#>, deffinition: <#String#>, definition2: <#String?#>))
//        
//        glossaryArray.append(GlossaryModel(item: <#String#>, alsoKnownAs: <#String?#>, deffinition: <#String#>, definition2: <#String?#>))
    }
    
}
