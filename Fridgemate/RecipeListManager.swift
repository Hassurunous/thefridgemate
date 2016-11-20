//
//  RecipeListManager.swift
//  Fridgemate
//
//  Created by MakeSchool on 10/26/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON

protocol RecipeManagerDelegate {
    func didLoadRecipes()
}

class RecipeListManager {
    static let sharedInstance = RecipeListManager()
    
    var delegate:RecipeManagerDelegate?
    
    // TODO: Setup these arrays as arrays of string
    var missedIngredientArray:[String] = []
    var usedIngredientArray:[String] = []
    
    
    let URL = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/searchComplex"
    var savedRecipeArray = [RecipeResult]()
    
    
    
    func RecipeSearch() {
        PantryManager.sharedInstance.load()
        
        let headers = [
            "X-Mashape-Key":"Hppop5c3XNmsh6WS0tTXm2LrwB77p10grKmjsnWI5GNJIgOtvx"
        ]
        let params = [
            "includeIngredients":"\(PantryManager.sharedInstance.pantryArray)",
            "addRecipeInformation":"true",
            "fillIngredients":"true"
            
        ]
        _ =  Alamofire.request(URL,parameters: params, headers: headers).validate().responseJSON() { response in
            switch response.result {
            case .success:
                
                
                if let value = response.result.value {
                    let recipeData = JSON(value)
                    
                    // print(recipeData)
                    
                    
                    let allRecipeData = recipeData["results"].array!
                    print(allRecipeData)
                    
                    let recipeArray: [String] = []
                    
                    self.savedRecipeArray = []
                    
                    for recipe in allRecipeData {
                        let readyInMinutes = recipe["readyInMinutes"].int!
                        let title = recipe["title"].string!
                        let image = recipe["image"].string!
                        let id = recipe["id"].int!
                        let servingNumber = recipe["servings"].int!
                        let missedIngredientJSONArray = recipe["missedIngredients"].array!
                        
                        var missedIngredientArray:[String] = []

                        for ingredient in missedIngredientJSONArray {
                            // TODO: append ingredient to tempmissing
                            // TODO: Fixe spelling
                            let ing = ingredient["originalString"].string!
                            missedIngredientArray.append(ing)
                            
                        }
                        let missingArray =  missedIngredientArray
                        let ingredientsMissed = missingArray.count
                        
                        // TODO: Append tempmissing to missedIngredientArray
                        
                        let usedIngredientJSONArray = recipe["usedIngredients"].array!
                        var usedIngredientArray:[String] = []
                        for ingredient in usedIngredientJSONArray {
                            
                            let ing = ingredient["name"].string!
                            usedIngredientArray.append(ing)
                            
                        }
                        
                        let usedArray = usedIngredientArray
                        let ingredientsUsed = usedArray.count
                        
                        
                        self.savedRecipeArray.append(RecipeResult(title: title, id: id, image: image,  ingredientsUsed: ingredientsUsed, ingredientsMissing: ingredientsMissed, readyInMinutes: readyInMinutes, servingNumber:servingNumber, missingArray:missingArray, usedArray:usedArray))
                        
                        
                    }
    
                    if let delegate = self.delegate {
                        delegate.didLoadRecipes()
                        print("delegate in RecipeListManager called")
                    }
                    
                    let recipeListString  = recipeArray.joined(separator: ",")
                    UserDefaults.standard.set(recipeListString, forKey:"recipeList")
                }
                
            case .failure(let error):
                self.savedRecipeArray.append(RecipeResult(title: "Sorry! Try adjusting your pantry list and then search!", id: 0, image: "",  ingredientsUsed: 0, ingredientsMissing: 0, readyInMinutes: 0, servingNumber:0, missingArray:[], usedArray:[]))
                
                if let delegate = self.delegate {
                    delegate.didLoadRecipes()
                    print("delegate in RecipeListManager called because there was a failure")
                }
                
                print()
                print("--------------------------")
                print(error)
                print("2")
            }
        }
    }
}



