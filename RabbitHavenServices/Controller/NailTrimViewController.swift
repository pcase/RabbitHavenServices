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
        
        serviceDataModel.updateServiceData(quantity: 1)
        
        rabbitLabel.text = Utils.intToString(num: 1) + Constants.SPACE + Constants.RABBIT
        donationLabel.text = Constants.DOLLAR_SIGN + Utils.intToString(num: serviceDataModel.donation)
        durationLabel.text = Utils.intToString(num: serviceDataModel.duration) + Constants.SPACE + Constants.MINUTES
        usdLabel.text = Utils.floatToString(num: serviceDataModel.donationUSD)
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
        
        serviceDataModel.updateServiceData(quantity: quantity)
        
        donationLabel.text = Constants.DOLLAR_SIGN + String(serviceDataModel.donation)
        durationLabel.text = String(serviceDataModel.duration) + Constants.SPACE + Constants.MINUTES
        usdLabel.text = Utils.floatToString(num: serviceDataModel.donationUSD)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProvider" {
            let vcProvider = segue.destination as? ProviderViewController
            vcProvider?.serviceDataModel = serviceDataModel
        }
    }
}
