//
//  DetailsViewController.swift
//  Fridgemate
//
//  Created by MakeSchool on 10/31/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    static let sharedInstance = DetailsViewController()

    // MARK: - IBOutlets

    @IBOutlet weak var detailRecipeTitle: UILabel!
    
    @IBOutlet weak var recipeImage: UIImageView!
    
    
    var recipe:RecipeResult? = nil

    
    
    
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
        if segue.identifier == "getRecipeSegue" {            if let indexPath = tableView.indexPathForSelectedRow {
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
