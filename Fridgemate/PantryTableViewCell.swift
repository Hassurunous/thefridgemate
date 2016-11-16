//
//  PantryTableViewCell.swift
//  Fridgemate
//
//  Created by MakeSchool on 10/25/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import UIKit

protocol PantryTableViewCellDelegate: class {
    func sliderValueChanged(value: Float)
}

class PantryTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var slider: UISlider!
    weak var delegate: PantryTableViewCellDelegate?


    @IBOutlet weak var ingredientLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        delegate?.sliderValueChanged(value: sender.value)
    }
}
