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

protocol RecipeStepDelegate {
    func loadRecipes()
}

class DetailsViewController: UIViewController, RecipeManagerDelegate {
    
    //MARK: Initial declarations
    
    static let sharedInstance = DetailsViewController()
    var delegate:RecipeStepDelegate?
    var recipe:RecipeResult? = nil
    var missedIngredientArray:[String] = []
    var usedIngredientArray:[String] = []
    var id:Int = 0
    var readyInMinutes:Int = 0
    var usedArray:[String] = []
    var missedArray:[String] = []
    var allIngredientsArray:[String] = []
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var detailRecipeTitle: UILabel!
    @IBOutlet weak var readyInMinutesLabel: UILabel!
    @IBOutlet weak var servingNumberLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var usedIngredientTable: UITableView!
    @IBOutlet weak var allIngredientsTable: UITableView!
    
    // MARK: RecipeManagerDelegate functions
    
    func didLoadRecipes() {
        
        allIngredientsTable.reloadData()
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Recipe Details"
        self.navigationController?.navigationBar.barTintColor = UIColor.brown
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        RecipeListManager.sharedInstance.delegate = self
        self.allIngredientsTable.layer.cornerRadius = 12;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        usedIngredientArray = RecipeListManager.sharedInstance.usedIngredientArray
        missedIngredientArray = RecipeListManager.sharedInstance.missedIngredientArray
        
        if let recipe = recipe {
            id = recipe.id
            readyInMinutes = recipe.readyInMinutes
            readyInMinutesLabel.text = "Ready in: \(recipe.readyInMinutes) minutes"
            servingNumberLabel.text = "Servings: \(recipe.servingNumber)"
            usedArray = recipe.usedArray
            missedArray = recipe.missingArray
            allIngredientsArray = recipe.allIngredientsArray
            
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
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getRecipeSegue" {
            let destVC = segue.destination as! RecipeStepTableViewController
            
            destVC.id = self.id
            
            
        }
        else if segue.identifier == "missingSegue" {
            let destVC = segue.destination as! MissingIngredientTableViewController
            
            destVC.recipe = self.recipe
            
            
        }
    }

   
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        switch tableView {
            
        case allIngredientsTable: cell.textLabel?.text = allIngredientsArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.white; return cell

       // case usedIngredientTable: cell.textLabel?.text = usedArray[indexPath.row]; return cell
            
        default: return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView {
        case allIngredientsTable: return allIngredientsArray.count
            
        //case usedIngredientTable: return usedArray.count
            
        default: return 1
        }

    }
    
    
    
}

