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
    static let sharedInstance = DetailsViewController()
    var delegate:RecipeStepDelegate?
    var recipe:RecipeResult? = nil
    var missedIngredientArray:[String] = []
    var usedIngredientArray:[String] = []
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var detailRecipeTitle: UILabel!
    
    @IBOutlet weak var readyInMinutesLabel: UILabel!
    @IBOutlet weak var servingNumberLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var usedIngredientTable: UITableView!
    @IBOutlet weak var missedIngredientTable: UITableView!
    var id:Int = 0
    var readyInMinutes:Int = 0
    var usedArray:[String] = []
    var missedArray:[String] = []
    
    
    
    
    // MARK: RecipeManagerDelegate functions
    
    func didLoadRecipes() {
        usedIngredientTable.reloadData()
        missedIngredientTable.reloadData()
        print(usedIngredientArray.count)
        print(missedIngredientArray.count)
    }
    
    // MARK: - View stuff
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Recipe View"
        self.navigationController?.navigationBar.barTintColor = UIColor.brown
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        // Do any additional setup after loading the view.
        RecipeListManager.sharedInstance.delegate = self
        print("setting Detail TBLV delegate")
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
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getRecipeSegue" {    print()
            let destVC = segue.destination as! RecipeStepTableViewController
            // destVC.recipeSteps = recipeStepArray
            
            // TODO: fix this
            destVC.id = self.id
            
        }
        
        
    }
    
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       
        
        switch tableView {
        case missedIngredientTable: cell.textLabel?.text = missedArray[indexPath.row]; return cell
        case usedIngredientTable: cell.textLabel?.text = usedArray[indexPath.row]; return cell
        default: return cell
        }
//        if tableView === missedIngredientTable {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//            return cell
//        }
//        else if tableView === usedIngredientTable {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//            return cell
//        }
//        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(missedArray)
        print("---------")
        print("---------")
        print(usedArray)
        switch tableView {
        case missedIngredientTable: return missedArray.count
            

        case usedIngredientTable: return usedArray.count

        default: return 1
        }
        
//        if tableView === missedIngredientTable {
//            return missedIngredientArray.count
//        }
//        else if tableView === usedIngredientTable {
//            return usedIngredientArray.count
//        }
//        return 1
    }
    
    
    
}

