//
//  NailTrimViewController.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/11/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import UIKit

class NailTrimViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var rabbitLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var donationLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var usdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.minimumValue = 1
        stepper.maximumValue = 6
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let quantity : Int = Int(sender.value)
        let rabbitText : String = "Rabbit"
        let donation : Int = 5
        let duration : Int = 10
        let USD : Float = 5.00
        
        numberLabel.text = Int(sender.value).description
        
        if (quantity > 1) {
            rabbitLabel.text = rabbitText + "s";
        } else {
            rabbitLabel.text = rabbitText
        }
        
        rabbitLabel.text = rabbitText + "s"
        donationLabel.text = "$" + String(quantity * donation)
        durationLabel.text = String(quantity * duration)
        usdLabel.text = String(format: "%.2f", Float(quantity) * USD)
    }
}
