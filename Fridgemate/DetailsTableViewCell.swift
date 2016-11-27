//
//  DetailsTableViewCell.swift
//  Fridgemate
//
//  Created by MakeSchool on 11/25/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var missingIngredientTextLable: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
