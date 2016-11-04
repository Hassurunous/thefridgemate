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
//    let prepTime:Int
//    let cookingTime: Int
//    let servings: Int
    let ingredientsUsed:Int
    let ingredientsMissing:Int
    
    
    init(title:String,id:Int,image:String,ingredientsUsed:Int,ingredientsMissing:Int) {
        self.title = title
        self.id = id
        self.image = image
//        self.prepTime = prepTime
//        self.cookingTime = cookingTime
//        self.servings = servings
        self.ingredientsUsed = ingredientsUsed
        self.ingredientsMissing = ingredientsMissing
    }
    
}
