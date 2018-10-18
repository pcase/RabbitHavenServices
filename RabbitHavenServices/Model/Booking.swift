//
//  ServiceDataModel.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/14/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import Foundation

class Booking {
    
    var service  : String = ""
    var providerIds : [String] = []
    var providerId: String = ""
    var provider : String = ""
    var providerImageName : String = ""
    var donation : Int = 0
    var donationUSD : Float = 0
    var duration : Int = 0
    var quantity : Int = 0
    
    func updateServiceData(quantity: Int) {
        donation = quantity * Constants.DONATION_AMOUNT
        duration = quantity * Constants.DURATION_TIME
        donationUSD = Float(quantity) * Float(Constants.DONATION_AMOUNT_USD)
    }
}
