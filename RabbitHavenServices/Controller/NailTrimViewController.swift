//
//  NailTrimViewController.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/11/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import UIKit

class NailTrimViewController: UIViewController {

    var booking = Booking()
    var providerDictionary: [String:Provider] = [:]
    
    fileprivate var request: AnyObject?
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var rabbitLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var donationLabel: UILabel!
    
    @IBOutlet weak var usdLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getProviders()
        
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.minimumValue = 1
        stepper.maximumValue = 6
        
        booking.updateServiceData(quantity: 1)
        rabbitLabel.text = Utils.intToString(num: 1) + Constants.SPACE + Constants.RABBIT
        donationLabel.text = Constants.DOLLAR_SIGN + Utils.intToString(num: booking.donation)
        durationLabel.text = Utils.intToString(num: booking.duration) + Constants.SPACE + Constants.MINUTES
        usdLabel.text = Utils.floatToString(num: booking.donationUSD)
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

        booking.updateServiceData(quantity: quantity)
        booking.service = getServiceByQuantity(quantity: quantity)
        donationLabel.text = Constants.DOLLAR_SIGN + String(booking.donation)
        durationLabel.text = String(booking.duration) + Constants.SPACE + Constants.MINUTES
        usdLabel.text = Utils.floatToString(num: booking.donationUSD)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProvider" {
            let vcProvider = segue.destination as? ProviderViewController
            vcProvider?.booking = booking
        }
    }
    
    func getServiceByQuantity(quantity: Int) -> String {
        var service : String = ""
        switch quantity {
        case 1:
            service = Constants.NAIL_TRIMS_1_RABBIT
        case 2:
            service = Constants.NAIL_TRIMS_2_RABBITS_NAME
        case 3:
            service = Constants.NAIL_TRIMS_3_RABBITS_NAME
        case 4:
            service = Constants.NAIL_TRIMS_4_RABBITS_NAME
        case 5:
            service = Constants.NAIL_TRIMS_5_RABBITS_NAME
        case 6:
            service = Constants.NAIL_TRIMS_6_RABBITS_NAME
        default:
            service = "Error: Invalid quantity"
        }
        return service
    }

    
    func getProviders() {
        let networkLayer: NetworkLayer = NetworkLayer()
        
        // Get the token
        var parameters : [String: Any] = ["jsonrpc":"2.0",
                                          "method":Constants.GET_TOKEN_METHOD,
                                          "params":[Constants.COMPANY, Constants.API_KEY],
                                          "id":1
        ]
        
        let successHandler: ((Token)) -> Void = { (token) in
            
            let headers : [String: String] = ["Content-Type":"application/json; charset=UTF-8",
                                              "X-Company-Login":Constants.COMPANY,
                                              "X-Token":token.result
            ]
            
            parameters = ["jsonrpc":"2.0",
                        "method":"getUnitList",
                        "params":[],
                        "id":2
            ]
            
            let successHandler: ((Providers)) -> Void = { (provider) in
                var numberOfResults = provider.result.count
                for (key,value) in provider.result {
                    self.providerDictionary[value.name] = value
                    print(value.name)
                }
            }
            
            let errorHandler: (String) -> Void = { (error) in
                print(error)
            }
            
            networkLayer.request(httpMethod: Constants.POST, urlString: Constants.BASE_URL, headers: headers, parameters: parameters, successHandler: successHandler, errorHandler: errorHandler)
        }
        
        let errorHandler: (String) -> Void = { (error) in
            print(error)
        }
        
        networkLayer.request(httpMethod: Constants.POST, urlString: Constants.LOGIN_URL, headers: [:], parameters: parameters, successHandler: successHandler, errorHandler: errorHandler)
    }
}
