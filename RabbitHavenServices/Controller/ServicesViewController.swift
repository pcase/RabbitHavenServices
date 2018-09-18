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

class ServicesViewController: UIViewController {

    let realm = try! Realm()
    
    var serviceDataModel = ServiceDataModel()
    
    @IBOutlet weak var nailTrimButton: UIButton!

    @IBOutlet weak var homeHealthCheckButton: UIButton!

    @IBOutlet weak var bunnyHopButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        saveProviders()
        saveServices()
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func nailTrimTapped(_ sender: UIButton) {
        let service = getServiceByName(name: Constants.NAIL_TRIMS_1_RABBIT)
        serviceDataModel = initServiceDataModel(service: service)
    }

    @IBAction func homeHealthChecksTapped(_ sender: UIButton) {
        let service = getServiceByName(name: Constants.HOME_HEALTH_CHECKS_DEMONSTRATION_NAME)
        serviceDataModel = initServiceDataModel(service: service)
    }

    @IBAction func bunnyHopTapped(_ sender: UIButton) {
        let service = getServiceByName(name: Constants.BUNNY_HOP_PLAYTIME_NAME)
        serviceDataModel = initServiceDataModel(service: service)
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

    func saveProviders() {
        do {
            try realm.write {
                if let path = Bundle.main.path(forResource: "employees", ofType: "json") {
                    do {
                        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                        let json = try JSON(data: data)
                        
                        for (_, object) in json["Employees"] {
                            let newProvider = Provider()
                            newProvider.name = object["name"].stringValue
                            newProvider.detail = object["description"].stringValue
                            newProvider.image = object["image"].stringValue
                            realm.add(newProvider)
                        }
                    } catch let error {
                        print("parse error: \(error.localizedDescription)")
                    }
                } else {
                    print("Invalid filename/path.")
                }
            }
        } catch {
            print("Error initializing new realm, \(error)")
        }
    }
    
    func saveServices() {
        do {
            try realm.write {
                
                if let path = Bundle.main.path(forResource: "offers", ofType: "json") {
                    do {
                        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                        let json = try JSON(data: data)
                        
                        for (_, object) in json["Offers"] {
                            let newService = Service()
                            newService.name = object["name"].stringValue
                            newService.detail = object["description"].stringValue
                            newService.image = object["image"].stringValue
                            newService.price = object["price"].intValue
                            newService.priceCurrency = object["priceCurrency"].stringValue
                            realm.add(newService)
                        }
                    } catch let error {
                        print("parse error: \(error.localizedDescription)")
                    }
                } else {
                    print("Invalid filename/path.")
                }
            }
        } catch {
            print("Error initializing new realm, \(error)")
        }
    }
    
    func getServiceByName(name: String) -> Service {
        let realm = try! Realm()
        let serviceList = realm.objects(Service.self).filter("name == %@", name)
        return serviceList.first!
    }
    
    func initServiceDataModel(service: Service) -> ServiceDataModel {
        serviceDataModel = ServiceDataModel()
        serviceDataModel.donation = (service.price)
        serviceDataModel.duration = Constants.DURATION_TIME
        serviceDataModel.donationUSD = Float(serviceDataModel.donation)
        serviceDataModel.provider = ""
        serviceDataModel.quantity = 1
        serviceDataModel.service = service.name
        return serviceDataModel
    }
}
