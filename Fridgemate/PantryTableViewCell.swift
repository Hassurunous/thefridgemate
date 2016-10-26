//
//  PantryTableViewCell.swift
//  Fridgemate
//
//  Created by MakeSchool on 10/25/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import UIKit

class PantryTableViewCell: UITableViewCell {


    @IBOutlet weak var ingredientLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
