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

class DetailsViewController: UIViewController {
    static let sharedInstance = DetailsViewController()
    var delegate:RecipeStepDelegate?
    var recipe:RecipeResult? = nil
    
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var detailRecipeTitle: UILabel!
    
    @IBOutlet weak var readyInMinutesLabel: UILabel!
    @IBOutlet weak var servingNumberLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    var id:Int = 0
    var readyInMinutes:Int = 0
    
    

    // MARK: - View stuff
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Recipe View"
        self.navigationController?.navigationBar.barTintColor = UIColor.brown
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]

        
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        
        if let recipe = recipe {
            id = recipe.id
            readyInMinutes = recipe.readyInMinutes
            readyInMinutesLabel.text = "Ready in: \(recipe.readyInMinutes) minutes"
            servingNumberLabel.text = "Servings: \(recipe.servingNumber)"
            
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
