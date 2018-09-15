//
//  TimeViewController.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/11/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {
    
    var serviceDataModel = ServiceDataModel()
    
    @IBOutlet weak var serviceLabel: UILabel!
    
    @IBOutlet weak var donationAmount: UILabel!
    
    @IBOutlet weak var USDAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        serviceLabel.text = serviceDataModel.service
        donationAmount.text = Constants.DOLLAR_SIGN + Utils.intToString(num: serviceDataModel.donation)
        USDAmount.text = Utils.floatToString(num: serviceDataModel.donationUSD)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
