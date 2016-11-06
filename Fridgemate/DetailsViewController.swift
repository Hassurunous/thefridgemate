//
//  DetailsViewController.swift
//  Fridgemate
//
//  Created by MakeSchool on 10/31/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DetailsViewController: UIViewController {
    static let sharedInstance = DetailsViewController()
    var recipe:RecipeResult? = nil
    
    var recipeStepArray = [RecipeInstruction]()
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var detailRecipeTitle: UILabel!
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    var id:Int = 0
    
    
    @IBAction func getRecipe(_ sender: UIButton) {
       print("Recipe search button pressed")
        
        let aURL:String = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/\(self.id)/analyzedInstructions"
       
        let headers:[String:String] = [
            "X-Mashape-Key":"Hppop5c3XNmsh6WS0tTXm2LrwB77p10grKmjsnWI5GNJIgOtvx"
        ]
        let params:[String:String] = [
            "stepBreakDown":"true"
            // "includeIngredients":"\(PantryManager.sharedInstance.pantryArray)",
            // "addRecipeInformation":"true"
            //   "fillIngredients":"true"
            
        ]
        

        _ =  Alamofire.request(aURL,parameters: params,  headers: headers).validate().responseJSON() { response in
            switch response.result {
            case .success:
                
                
                if let value = response.result.value {
                    let recipeStepData = JSON(value)
                    
              //      print(recipeStepData)
                    print("-------------")
                    print("-------------")
                    
                    let allRecipeData = recipeStepData[0]["steps"].array!
                    //print(allRecipeData)
                    
                    for step in allRecipeData {
                        let number = step["number"].int!
                        let step = step["step"].string!
                        self.recipeStepArray.append(RecipeInstruction(stepNumber: number, stepDescription: step))
                        
                    }
                    print(self.recipeStepArray)
                    
                    

                    
//                    for recipe in allRecipeData {

                        
                        
                   // }
                    
                    

                    
                    
                    
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
    
    
    
    
    
    // MARK: - View stuff
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        print("Details will appear!!!!!!")
        
        if let recipe = recipe {
            id = recipe.id
            
            detailRecipeTitle.text = recipe.title
            
            let url = URL(string: recipe.image)!
            let session = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, eror) in
                if let data = data {
                    let image = UIImage(data: data)
                    self.recipeImage.image = image
                }
            })
            session.resume()
        }
        //        if let recipeIMAGE = recipeIMAGE {
        //            recipeImage.image = recipeIMAGE
        //        }
        //
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getRecipeSegue" {    print()
             let destVC = segue.destination as! RecipeStepTableViewController
            /*       if let indexPath = tableView.indexPathForSelectedRow {
            let destVC = segue.destination as! DetailsViewController
            print(RecipeListManager.sharedInstance.savedRecipeArray)
            destVC.recipe = RecipeListManager.sharedInstance.savedRecipeArray[indexPath.row]
            // destVC.detailRecipeTitle.text = RecipeListManager.sharedInstance.savedRecipeArray[indexPath.row].title
            
            
            }
            // Get the new view controller using segue.destinationViewController.
            // Pass the selected object to the new view controller.
        */}
        
        
    }
    
}
