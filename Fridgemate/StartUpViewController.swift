//
//  ViewController.swift
//  Fridgemate
//
//  Created by MakeSchool on 10/22/16.
//  Copyright © 2016 Kadeem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var counter: Double = 0.0
    var initialFontSize: CGFloat = 30.0
    @IBOutlet weak var tapToContinueLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        let repeatingFunction: Selector = #selector(ViewController.pulseButton)
        _ = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: repeatingFunction, userInfo: nil, repeats: true)
        
    }
    func pulseButton() {
        counter += 1.0
        
        // calculate elapsed time
        let adjustmentFactor = (counter / 100.0).truncatingRemainder(dividingBy: 10.0)
        var sizeAdjustment: Double = 0.0
        var alphaAdjustment: Double = 0.0
        
        // increase size and alpha
        if (adjustmentFactor < 5) {
            sizeAdjustment = (80.0 + 4.0 * adjustmentFactor) / 100.0
            alphaAdjustment = (40.0 + 12.0 * adjustmentFactor) / 100.0
        }
            // decrease size and alpha
        else {
            sizeAdjustment = (120.0 - 4.0 * adjustmentFactor) / 100.0
            alphaAdjustment = (160.0 - 12.0 * adjustmentFactor) / 100.0
        }
        
        tapToContinueLabel.font =  UIFont(name: (tapToContinueLabel.font?.fontName)!, size: initialFontSize * CGFloat(sizeAdjustment))
       tapToContinueLabel.alpha = CGFloat(alphaAdjustment)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




}

