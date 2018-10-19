//
//  HomeHealthCheckViewController.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 10/17/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import UIKit
import SVProgressHUD

class HomeHealthCheckViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    
    var booking = Booking()
    var providerDictionary: [String:Provider] = [:]
    
    fileprivate var request: AnyObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getProviders()
        booking.updateServiceData(quantity: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProvider" {
            let vcProvider = segue.destination as? ProviderViewController
            vcProvider?.booking = booking
            vcProvider?.providerDictionary = providerDictionary
        }
    }
    
    func getProviders() {
        
        SVProgressHUD.show()
        
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
            
            let successHandler: ((Providers)) -> Void = { (providers) in
                 SVProgressHUD.dismiss()
                _ = providers.result.count
                for (_,value) in providers.result {
                    if (self.booking.providerIds.contains(value.id)) {
                        self.providerDictionary[value.id] = value
                    }
                }
            }
            
            let errorHandler: (String) -> Void = { (error) in
                SVProgressHUD.dismiss()
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
