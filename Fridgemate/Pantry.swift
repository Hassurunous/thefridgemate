//
//  Pantry.swift
//  Fridgemate
//
//  Created by MakeSchool on 10/25/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import UIKit

class Pantry: UIViewController {
    
    //MARK: -  Variables
    var ingredientListArray:[String] = []
    var userDefaults = UserDefaults.standard
    
    //MARK: - IB Outlets
    
    @IBOutlet weak var ingredientTextField: UITextField!

    //MARK: - IB Actions
    
    
    @IBAction func addIngredientButton(_ sender: AnyObject) {
        var text = ingredientTextField.text
        if ingredientTextField.text != "" {
            for c in (ingredientTextField.text?.characters)! {
                if c != " " {
                    text = text?.trimmingCharacters(in: CharacterSet.whitespaces)
                    ingredientListArray.append(text!)
                    break
                }
            }
        }
        
        ingredientTextField.text="";
        let pantryListString  = ingredientListArray.joined(separator: ",")
        userDefaults.set(pantryListString, forKey: "pantryList")
        print(ingredientListArray)
        
    }
    
    
    //MARK: - Initial setup

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = (false)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "My Pantry"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.2)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK: - TableView Config

//extension Pantry :  {
//
// 
//    
//}
