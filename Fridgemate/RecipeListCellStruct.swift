//
//  RecipeListCellStruct.swift
//  Fridgemate
//
//  Created by MakeSchool on 10/27/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import Foundation
class RecipeResult {
    let title:String
    let id:Int
    let image:String

    let ingredientsUsed:Int
    let ingredientsMissing:Int
    let readyInMinutes:Int
    let servingNumber:Int
    let missingArray:[String]
    let usedArray:[String]
    let allIngredientsArray:[String]
    
    
    init(title:String,id:Int,image:String,ingredientsUsed:Int,ingredientsMissing:Int, readyInMinutes:Int, servingNumber:Int, missingArray:[String], usedArray:[String],allIngredientsArray:[String]) {
        self.title = title
        self.id = id
        self.image = image
        self.ingredientsUsed = ingredientsUsed
        self.ingredientsMissing = ingredientsMissing
        self.readyInMinutes = readyInMinutes
        self.servingNumber = servingNumber
        self.usedArray = usedArray
        self.missingArray = missingArray
        self.allIngredientsArray = allIngredientsArray
    }
    
}
