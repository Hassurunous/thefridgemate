//
//  RecipeStepTableViewCell.swift
//  Fridgemate
//
//  Created by MakeSchool on 11/5/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import UIKit

class RecipeStepTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var stepCountLabel: UILabel!

    @IBOutlet weak var stepDescriptionLabel: UITextView!
    



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
