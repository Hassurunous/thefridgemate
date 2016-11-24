//
//  MissingIngredientTableViewController.swift
//  Fridgemate
//
//  Created by MakeSchool on 11/23/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import UIKit

class MissingIngredientTableViewController: UITableViewController {
    var recipe:RecipeResult? = nil
    var missedArray:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        if let recipe = recipe {

            missedArray = recipe.missingArray
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.missedArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        
        // Configure the cell...
        print(#function)
        print(missedArray)
        return cell
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return self.missedArray.count
    }

    

}
