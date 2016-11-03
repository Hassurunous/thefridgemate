//
//  RecipeListTableViewController.swift
//  Fridgemate
//
//  Created by MakeSchool on 10/26/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import UIKit

class RecipeListViewController2: UIViewController, RecipeManagerDelegate, UITableViewDataSource, UITableViewDelegate {
     let recipeData = RecipeListManager()

    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // RecipeListManager.sharedInstance.RecipeSearch()
         self.navigationController?.isNavigationBarHidden = (false)
        RecipeListManager.sharedInstance.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
             
    }
    
    
    
    func didLoadRecipes() {
        print("Did load recipes ******")
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare func called")
        if segue.identifier == "toDetailsSegue" {
            print("segue ID confirmed")
            if let indexPath = tableView.indexPathForSelectedRow {
                let destVC = segue.destination as! DetailsViewController
                
                //         destVC.titleString = movieData.movieArray[indexPath.row].name
                //           destVC.descriptionString = movieData.movieArray[indexPath.row].description
                //                let url = URL(string: RecipeListManager.sharedInstance.savedRecipeArray[indexPath.row].image)
                //                let session = URLSession.shared.dataTask(with: url!) {(data,response, error) in
                //                    let image = UIImage(data: data!)
                //                    DispatchQueue.main.async {
                //                        destVC.recipeImage.image = image
                //
                //                    }
                //
                //                }
                //                session.resume()
                //                destVC.recipeImage.image = RecipeListManager.sharedInstance.savedRecipeArray[indexPath.row].image as! UIImage
                
                destVC.recipe = recipeData.savedRecipeArray[indexPath.row]
                // destVC.detailRecipeTitle.text = RecipeListManager.sharedInstance.savedRecipeArray[indexPath.row].title
                
                
            }
            // Get the new view controller using segue.destinationViewController.
            // Pass the selected object to the new view controller.
        }
        
        
    }


    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return RecipeListManager.sharedInstance.savedRecipeArray.count

   
    }


    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
         
    */
}

