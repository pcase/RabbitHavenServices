//
//  ViewController.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/10/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift
import Alamofire

class ServicesViewController: UIViewController {

    let realm = try! Realm()
    
    var booking = Booking()
    
    var serviceList: [Service] = []
    var serviceDictionary: [String:Service] = [:]
    
    @IBOutlet weak var nailTrimButton: UIButton!

    @IBOutlet weak var homeHealthCheckButton: UIButton!

    @IBOutlet weak var bunnyHopButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        getServices()
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func nailTrimTapped(_ sender: UIButton) {
        booking = initServiceDataModel(name: Constants.NAIL_TRIMS)
    }

    @IBAction func homeHealthChecksTapped(_ sender: UIButton) {
        booking = initServiceDataModel(name: Constants.HOME_HEALTH_CHECKS)
    }

    @IBAction func bunnyHopTapped(_ sender: UIButton) {
        booking = initServiceDataModel(name: Constants.BUNNY_HOP)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNailTrims" {
            let vcNailTrim = segue.destination as? NailTrimViewController
            vcNailTrim?.booking = booking
        }

        if segue.identifier == "goToProviderFromServices" {
            let vcProvider = segue.destination as? ProviderViewController
            vcProvider?.booking = booking
        }

        if segue.identifier == "goToTimeFromServices" {
            let vcTime = segue.destination as? TimeViewController
            vcTime?.booking = booking
        }
    }
    
    func initServiceDataModel(name: String) -> Booking {
        let service = serviceDictionary[name]
        booking = Booking()
        booking.donation = (service?.price_without_tax)!
        booking.duration = Constants.DURATION_TIME
        booking.donationUSD = Float(booking.donation)
        booking.provider = ""
        booking.quantity = 1
        booking.service = (service?.name)!
        return booking
    }
    
    func getServices() {
        let networkLayer: NetworkLayer = NetworkLayer()
        
        // Get the token
        var parameters : [String: Any] = ["jsonrpc":"2.0",
                                          "method":Constants.GET_TOKEN_METHOD,
                                          "params":[Constants.COMPANY, Constants.API_KEY],
                                          "id":1
        ]
        
        let successHandler: ((Token)) -> Void = { (token) in
            print(token)
            
            let headers : [String: String] = ["Content-Type":"application/json; charset=UTF-8",
                                              "X-Company-Login":Constants.COMPANY,
                                              "X-Token":token.result
            ]
            
            parameters = ["jsonrpc":"2.0",
                          "method":"getEventList",
                          "params":[],
                          "id":1
            ]
            
            let successHandler: ((Services)) -> Void = { (service) in
                var numberOfResults = service.result.count
                for (key,value) in service.result {
                    self.serviceDictionary[value.name] = value
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
