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

class RecipeListManager {
    static let sharedInstance = RecipeListManager()
    
//    var recipeList = UserDefaults.standard.object(forKey: "savedRecipeList")! as! [String]
    
    let complexURL = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/searchComplex"
  

    
    func RecipeSearch() {
        PantryManager.sharedInstance.load()
        
        let headers = [
            "X-Mashape-Key":"Hppop5c3XNmsh6WS0tTXm2LrwB77p10grKmjsnWI5GNJIgOtvx"
        ]
        let params = [
            "includeIngredients":"\(PantryManager.sharedInstance.pantryArray)",
            "fillIngredients":"true"
        ]
        _ =  Alamofire.request(complexURL,parameters: params, headers: headers).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let recipeData = JSON(value)
                    
                    //                     var savedRecipeList: [String] = self.userDefaults.objectForKey("savedRecipeList") as! [String]
                    // print(recipeData)
                    let allRecipeData = recipeData["results"].arrayValue
                    var recipeArray: [String] = []
                    for i in 0..<allRecipeData.count {
                        
                        let title = allRecipeData[i]["title"].rawString()
                        
                        //   let allRecipeData = recipeData["results"][i]
                        // let tRecipes = RecipeTitle(json: allRecipeData[i])
                        // let tRecipes = RecipeData(json:recipeData )
                        recipeArray.append(title!)
                        
                        
                    }
    //                let placeholder = recipeArray
                    
                    let recipeListString  = recipeArray.joined(separator: ",")
      //              UserDefaults.standard.set(recipeListString, forKey:"recipeList")
   //                UserDefaults.standard.set(recipeArray, forKey: "savedRecipeList")
                    
                    print(recipeListString)
                    print("____________________")
                    
                    
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
    }
    
   

