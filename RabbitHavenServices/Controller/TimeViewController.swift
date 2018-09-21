//
//  TimeViewController.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/11/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {
    
    var booking = Booking()
    
    @IBOutlet weak var serviceLabel: UILabel!
    
    @IBOutlet weak var donationAmount: UILabel!
    
    @IBOutlet weak var USDAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        serviceLabel.text = booking.service
        donationAmount.text = Constants.DOLLAR_SIGN + Utils.intToString(num: booking.donation)
        USDAmount.text = Utils.floatToString(num: booking.donationUSD)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
