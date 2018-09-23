//
//  NailTrimViewController.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/11/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import UIKit
//import RealmSwift
//import Alamofire
import SwiftyJSON

class NailTrimViewController: UIViewController {

    let COMPANY = "azurehorsecreations"
    let BOOKING_URL = "https://user-api.simplybook.me/"
    let API_KEY = "0fb8587f79818d57abe68fb821dab098a33dc8ce6f75aa7e74a40c69079915de"
    var booking = Booking()
    fileprivate var request: AnyObject?
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var rabbitLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var donationLabel: UILabel!
    
    @IBOutlet weak var usdLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchService()

//        let parameters: Parameters = [
//            "jsonrpc": "2.0",
//            "method": "getEventList",
//            "params": [],
//            "id":1
//        ]
//        getEventList(url: BOOKING_URL, parameters: parameters)
        
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

//        let quantity : Int = Int(sender.value)
//
//        if (quantity > 1) {
//            rabbitLabel.text = String(quantity) + Constants.SPACE + Constants.RABBIT + Constants.S;
//        } else {
//            rabbitLabel.text = String(quantity) + Constants.SPACE + Constants.RABBIT
//        }
//
//        booking.updateServiceData(quantity: quantity)
//        booking.service = getServiceByQuantity(quantity: quantity).name
//        donationLabel.text = Constants.DOLLAR_SIGN + String(booking.donation)
//        durationLabel.text = String(booking.duration) + Constants.SPACE + Constants.MINUTES
//        usdLabel.text = Utils.floatToString(num: booking.donationUSD)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToProvider" {
            let vcProvider = segue.destination as? ProviderViewController
            vcProvider?.booking = booking
        }
    }
    
//    func getServiceByQuantity(quantity: Int) -> ServiceDB {
//        let realm = try! Realm()
//
//        var service : String = ""
//        switch quantity {
//        case 1:
//            service = Constants.NAIL_TRIMS_1_RABBIT
//        case 2:
//            service = Constants.NAIL_TRIMS_2_RABBITS_NAME
//        case 3:
//            service = Constants.NAIL_TRIMS_3_RABBITS_NAME
//        case 4:
//            service = Constants.NAIL_TRIMS_4_RABBITS_NAME
//        case 5:
//            service = Constants.NAIL_TRIMS_5_RABBITS_NAME
//        case 6:
//            service = Constants.NAIL_TRIMS_6_RABBITS_NAME
//        default:
//            print("Error: Invalid quantity")
//        }
//
//        let serviceList = realm.objects(ServiceDB.self).filter("name == %@", service)
//        return serviceList.first!
//        return nil
//    }
    
    func fetchService() {
        let serviceResource = ServiceResource()
        let serviceRequest = ApiRequest(resource: serviceResource)
        request = serviceRequest
        serviceRequest.load { [weak self] (services) in
            guard let ss = services, let topService = ss?.items.first else {
                return
            }
            print(topService.title)
        }
    }
    
//    func getEventList(url: String, parameters: Parameters) {
//
//        var parameters : [String:Any] = [:]
//        var token = ""
//
//        // Get the token
//        parameters = ["jsonrpc":"2.0",
//                    "method":"getToken",
//                    "params":[COMPANY,API_KEY],
//                    "id":1
//        ]
//
//        Alamofire.request(BOOKING_URL + "/login/", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
//            if response.result.isSuccess {
//                print("Success! Got the token")
//                let json : JSON = JSON(response.result.value!)
//                print(json)
//                token = json["result"].string!
//                print("token = " + token)
//
//
//                // Get the event list (services)
//                let headers = ["Content-Type":"application/json; charset=UTF-8",
//                               "X-Company-Login":self.COMPANY,
//                               "X-Token":token
//                ]
//
//                parameters = ["jsonrpc":"2.0",
//                              "method":"getEventList",
//                              "params":[],
//                              "id":1
//                ]
//
//                Alamofire.request(self.BOOKING_URL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
//                    if response.result.isSuccess {
//                        print("Success! Got the event list")
//                        let json : JSON = JSON(response.result.value!)
//                        print(json)
//                    }
//                    else {
//                        print("Error \(response.result.error)")
//                    }
//                }
//
//                // Get the service providers
//                let headers2 = ["Content-Type":"application/json; charset=UTF-8",
//                           "X-Company-Login":self.COMPANY,
//                           "X-Token":token
//                ]
//
//                parameters = ["jsonrpc":"2.0",
//                              "method":"getUnitList",
//                              "params":[],
//                              "id":2
//                ]
//
//                Alamofire.request(self.BOOKING_URL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers2).responseJSON { response in
//                    if response.result.isSuccess {
//                        print("Success! Got the unit list")
//                        let json : JSON = JSON(response.result.value!)
//                        print(json)
//                    }
//                    else {
//                        print("Error \(response.result.error)")
//                    }
//                }
//            }
//            else {
//                print("Error \(response.result.error)")
//            }
//        }
//    }
}
