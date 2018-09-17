//
//  ViewController.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/10/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import UIKit
import SwiftyJSON

class ServicesViewController: UIViewController {

    var serviceDataModel = ServiceDataModel()
    
    @IBOutlet weak var nailTrimButton: UIButton!

    @IBOutlet weak var homeHealthCheckButton: UIButton!

    @IBOutlet weak var bunnyHopButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        getProviderData()
        getServicesData()
        
        serviceDataModel.donation = 5
        serviceDataModel.duration = 10
        serviceDataModel.donationUSD = 5.00
        serviceDataModel.provider = "anyprovider"
        serviceDataModel.quantity = 1
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func nailTrimTapped(_ sender: UIButton) {
        serviceDataModel.service = Constants.NAIL_TRIMS
    }

    @IBAction func homeHealthChecksTapped(_ sender: UIButton) {
        serviceDataModel.service = Constants.HOME_HEALTH_CHECKS
    }

    @IBAction func bunnyHopTapped(_ sender: UIButton) {
        serviceDataModel.service = Constants.BUNNY_HOP
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNailTrims" {
            let vcNailTrim = segue.destination as? NailTrimViewController
            vcNailTrim?.serviceDataModel = serviceDataModel
        }

        if segue.identifier == "goToProviderFromServices" {
            let vcProvider = segue.destination as? ProviderViewController
            vcProvider?.serviceDataModel = serviceDataModel
        }

        if segue.identifier == "goToTimeFromServices" {
            let vcTime = segue.destination as? TimeViewController
            vcTime?.serviceDataModel = serviceDataModel
        }
    }
    
    func getProviderData() {
        if let path = Bundle.main.path(forResource: "employees", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let json = try JSON(data: data)
                let arrayNames = json["Employees"].arrayValue.map({$0["name"].stringValue})
                for name in arrayNames {
                    print(name)
                }
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
    }
    
    func getServicesData() {
        if let path = Bundle.main.path(forResource: "offers", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let json = try JSON(data: data)
                let arrayNames = json["Offers"].arrayValue.map({$0["name"].stringValue})
                for name in arrayNames {
                    print(name)
                }
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
    }
}
