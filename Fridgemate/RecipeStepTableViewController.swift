//
//  RecipeStepTableViewController.swift
//  Fridgemate
//
//  Created by MakeSchool on 11/5/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RecipeStepTableViewController: UITableViewController {
    
    
    var recipeSteps = [RecipeInstruction]()
    var id:Int = 0
    var recipeStepArray = [RecipeInstruction]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        request()
        
        navigationItem.title = "Recipe Steps"
        self.navigationController?.navigationBar.barTintColor = UIColor.brown
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func loadRecipes() {
        tableView.reloadData()
    }
    func request() {
        
        let aURL:String = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/\(self.id)/analyzedInstructions"
        
        let headers:[String:String] = [
            "X-Mashape-Key":"Hppop5c3XNmsh6WS0tTXm2LrwB77p10grKmjsnWI5GNJIgOtvx"
        ]
        let params:[String:String] = [
            "stepBreakDown":"true",
            // "includeIngredients":"\(PantryManager.sharedInstance.pantryArray)",
            // "addRecipeInformation":"true"
              // "fillIngredients":"true"
            
        ]
        
        
        _ =  Alamofire.request(aURL,parameters: params,  headers: headers).validate().responseJSON() { response in
            switch response.result {
            case .success:
                
                
                if let value = response.result.value {
                    let recipeStepData = JSON(value)
                    
                    if  let allRecipeData = recipeStepData[0]["steps"].array {
                        for step in allRecipeData {
                            let number = step["number"].int!
                            let step = step["step"].string!
                            self.recipeStepArray.append(RecipeInstruction(stepNumber: number, stepDescription: step))
                            
                        }
                        self.tableView.reloadData()
                    }
                    else {
                        print("this recipe doesnt have any steps")
                        self.recipeStepArray.append(RecipeInstruction(stepNumber: 0, stepDescription: "Sorry! This recipe is not available 😩"))
                        self.tableView.reloadData()
                    }
    
                }
                
            case .failure(let error):
                print()
                //
                print()
                print()
                print("--------------------------")
                print(error)
                print("2")
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //  print(DetailsViewController.sharedInstance.recipeStepArray.count)
        // print("______-----_____")
        return recipeStepArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecipeStepTableViewCell
        let recipe = recipeStepArray[indexPath.row]
        
        cell.stepCountLabel.text = "\(recipe.stepNumber)"
        cell.stepDescriptionLabel.text = recipe.stepDescription

        // Configure the cell...
        
        return cell
    }

    
}
