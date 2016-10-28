//
//  RecipeListCellStruct.swift
//  Fridgemate
//
//  Created by MakeSchool on 10/27/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import Foundation
class RecipeResultStruct {
    let title:String
    let id:Int
    let image:String
    
    let ingredientsUsed:Int
    let ingredientsMissing:Int
    
    
    init(title:String,id:Int,image:String,ingredientsUsed:Int,ingredientsMissing:Int) {
        self.title = title
        self.id = id
        self.image = image
        
        self.ingredientsUsed = ingredientsUsed
        self.ingredientsMissing = ingredientsMissing
    }
    
}
