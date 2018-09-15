//
//  NailTrimViewController.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/11/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import UIKit

class NailTrimViewController: UIViewController {

    var serviceDataModel = ServiceDataModel()
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var rabbitLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var donationLabel: UILabel!
    
    @IBOutlet weak var usdLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.minimumValue = 1
        stepper.maximumValue = 6
        
        rabbitLabel.text = intToString(num: 1) + Constants.SPACE + Constants.RABBIT
        donationLabel.text = Constants.DOLLAR_SIGN + intToString(num: self.serviceDataModel.donation)
        durationLabel.text = intToString(num: self.serviceDataModel.duration) + Constants.SPACE + Constants.MINUTES
        usdLabel.text = floatToString(num: self.serviceDataModel.donationUSD)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {

        let quantity : Int = Int(sender.value)
        
        if (quantity > 1) {
            rabbitLabel.text = String(quantity) + Constants.SPACE + Constants.RABBIT + Constants.S;
        } else {
            rabbitLabel.text = String(quantity) + Constants.SPACE + Constants.RABBIT
        }
        
        donationLabel.text = Constants.DOLLAR_SIGN + String(quantity * serviceDataModel.donation)
        durationLabel.text = String(quantity * serviceDataModel.duration) + Constants.SPACE + Constants.MINUTES
        usdLabel.text = floatToString(num: Float(quantity) * serviceDataModel.donationUSD)
    }
    
    func intToString(num: Int) -> String {
        return String(num)
    }
    
    func floatToString(num: Float) -> String {
        return String(format: "%.2f", Float(num))
    }
}
