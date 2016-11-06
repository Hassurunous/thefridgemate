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
    
    
    
    let URL = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/searchComplex"
    var savedRecipeArray = [RecipeResult]()
    
    
    
    func RecipeSearch() {
        PantryManager.sharedInstance.load()
        
        let headers = [
            "X-Mashape-Key":"Hppop5c3XNmsh6WS0tTXm2LrwB77p10grKmjsnWI5GNJIgOtvx"
        ]
        let params = [
            "includeIngredients":"\(PantryManager.sharedInstance.pantryArray)",
           // "addRecipeInformation":"true"
            //"fillIngredients":"true"
            
        ]
        _ =  Alamofire.request(URL,parameters: params, headers: headers).validate().responseJSON() { response in
            switch response.result {
            case .success:
                
                
                if let value = response.result.value {
                    let recipeData = JSON(value)
                    
                  //  print(recipeData)

                    
                    let allRecipeData = recipeData["results"].array!
                       //print(allRecipeData)
                    let recipeArray: [String] = []
                    
                    self.savedRecipeArray = []
                    
                    for recipe in allRecipeData {
                        let title = recipe["title"].string!
                        let image = recipe["image"].string!

                        let ingredientsUsed = recipe["usedIngredientCount"].int!
                        let ingredientsMissed = recipe["missedIngredientCount"].int!
                        let id = recipe["id"].int!
                        
                        self.savedRecipeArray.append(RecipeResult(title: title, id: id, image: image,  ingredientsUsed: ingredientsUsed, ingredientsMissing: ingredientsMissed))
                        
                        
                    }
                    
                   
                    print(self.delegate)
                    
                    if let delegate = self.delegate {
                        delegate.didLoadRecipes()
                    }
                    
                    let recipeListString  = recipeArray.joined(separator: ",")
                    UserDefaults.standard.set(recipeListString, forKey:"recipeList")

                    
                    
                }
                
            case .failure(let error):
                print()
                print()
                print()
                print("--------------------------")
                print(error)
                print("2")
            }
        }
    }
    // var recipeList = UserDefaults.standard.object(forKey: "savedRecipeList")! as! [String]
}



