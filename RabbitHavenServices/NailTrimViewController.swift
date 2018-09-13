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
    
    @IBOutlet weak var rabbitLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var donationLabel: UILabel!
    
    @IBOutlet weak var usdLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    private let rabbitText : String = "Rabbit"
    private let durationText : String = "minutes"
    private let donation : Int = 5
    private let duration : Int = 10
    private let USD : Float = 5.00
    private let space : String = " "
    private let dollarSign : String = "$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.minimumValue = 1
        stepper.maximumValue = 6
        
        rabbitLabel.text = intToString(num: 1) + space + rabbitText
        donationLabel.text = dollarSign + intToString(num: donation)
        durationLabel.text = intToString(num: 10) + space + durationText
        usdLabel.text = floatToString(num: USD)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let s : String = "s"

        let quantity : Int = Int(sender.value)
        
        if (quantity > 1) {
            rabbitLabel.text = String(quantity) + space + rabbitText + s;
        } else {
            rabbitLabel.text = String(quantity) + space + rabbitText
        }
        
        donationLabel.text = dollarSign + String(quantity * donation)
        durationLabel.text = String(quantity * duration) + space + durationText
        usdLabel.text = floatToString(num: Float(quantity) * USD)
    }
    
    func intToString(num: Int) -> String {
        return String(num)
    }
    
    func floatToString(num: Float) -> String {
        return String(format: "%.2f", Float(num))
    }
}
