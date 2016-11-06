//
//  RecipeStep.swift
//  
//
//  Created by MakeSchool on 11/5/16.
//
//

import Foundation
struct RecipeInstruction {
    let stepNumber:Int
    let stepDescription:String
    
    init(stepNumber:Int,stepDescription:String) {
        self.stepNumber = stepNumber
        self.stepDescription = stepDescription
    }
}
