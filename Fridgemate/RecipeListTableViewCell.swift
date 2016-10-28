//
//  RecipeListTableViewCell.swift
//  Fridgemate
//
//  Created by MakeSchool on 10/27/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import UIKit

class RecipeListTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var ingredientsUsedLabel: UILabel!
    @IBOutlet weak var ingredientsMissingLabel: UILabel!
    
    @IBOutlet weak var recipeImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
