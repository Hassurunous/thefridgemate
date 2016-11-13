//
//  RecipeListTableViewController.swift
//  Fridgemate
//
//  Created by MakeSchool on 10/26/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import UIKit

class RecipeListTableViewController: UITableViewController, RecipeManagerDelegate {


    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Recipe List"
        self.navigationController?.navigationBar.barTintColor = UIColor.brown
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.selectedIndex = 1;
       // RecipeListManager.sharedInstance.RecipeSearch()
         self.navigationController?.isNavigationBarHidden = (false)
        RecipeListManager.sharedInstance.delegate = self


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
          //      self.navigationItem.rightBarButtonItem?.tintColor?
    }
    
    
    
    func didLoadRecipes() {
//        print("Did load recipes!!!!!")
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RecipeListTableViewCell
        
        let recipe = RecipeListManager.sharedInstance.savedRecipeArray[indexPath.row]
        
        cell.recipeTitleLabel.text = recipe.title
        cell.ingredientsUsedLabel.text = "Ingredients Used:\(recipe.ingredientsUsed)"
        cell.ingredientsMissingLabel.text = "Ingredients Missing:\(recipe.ingredientsMissing)"
        let url = URL(string: recipe.image)
        let session = URLSession.shared.dataTask(with: url!) {(data,response, error) in
            if let image = UIImage(data: data!) {
                DispatchQueue.main.async {
                    cell.recipeImage.image = image
                    cell.setNeedsLayout()
                }
            }
        }

    session.resume()
        
        // Configure the cell...
        
        return cell
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return RecipeListManager.sharedInstance.savedRecipeArray.count
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            if segue.identifier == "toDetailsSegue" {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let destVC = segue.destination as! DetailsViewController
                    
                    print(RecipeListManager.sharedInstance.savedRecipeArray)
                    
                    destVC.recipe = RecipeListManager.sharedInstance.savedRecipeArray[indexPath.row]
                    // destVC.detailRecipeTitle.text = RecipeListManager.sharedInstance.savedRecipeArray[indexPath.row].title
                    
                    
                }
                // Get the new view controller using segue.destinationViewController.
                // Pass the selected object to the new view controller.
            }
            
            
        }
    

}

