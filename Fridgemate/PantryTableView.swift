//
//  PantryTableView.swift
//  Fridgemate
//
//  Created by MakeSchool on 10/25/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import UIKit

class PantryTableView: Pantry, UITableViewDelegate, UITableViewDataSource, PantryTableViewCellDelegate {
    
    var dataForSliders: [Float] = []
    
    @IBAction func recipeSearchButtonTapped(_ sender: UIButton) {
        RecipeListManager.sharedInstance.RecipeSearch()
        self.tabBarController?.selectedIndex = 1;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PantryTableViewCell
        
        cell.ingredientLabel.text = PantryManager.sharedInstance.pantryArray[indexPath.row]
        cell.delegate = self
//        cell.slider.value =  dataForSliders[indexPath.row] //
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return PantryManager.sharedInstance.count
    }
    
    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            PantryManager.sharedInstance.remove(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            // Delete the row from the data source
            //            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    func sliderValueChanged(value: Float) {
        print("slider value: \(value)")
    }
    
    
}


