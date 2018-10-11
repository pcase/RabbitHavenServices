//
//  ProviderViewController.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/11/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import UIKit

class ProviderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var booking = Booking()
    var providerDictionary: [String:Provider] = [:]
    
    @IBOutlet weak var tableView: UITableView!
    
    struct ProviderNameImage {
        let name: String
        let imagePath: String
        let id: String
    }

    var providerNameImageList = [ProviderNameImage]()
    
    func mapProviderDictionaryToStruct(dictionary:  [String:Provider]) -> [ProviderNameImage] {
        var arr = [ProviderNameImage]()
        var providerNameImage: ProviderNameImage

        for (_, value) in dictionary {
            providerNameImage = ProviderNameImage.init(name: value.name, imagePath: Constants.HOST + value.picture_path, id: value.id)
            arr.append(providerNameImage)
        }

        return arr
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        providerNameImageList = mapProviderDictionaryToStruct(dictionary: providerDictionary)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Datasource functions

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return providerNameImageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath)
        cell.textLabel?.text = providerNameImageList[indexPath.row].name
   
        // Download the image
        let url = URL(string: providerNameImageList[indexPath.row].imagePath)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in

            if error != nil {
                print(error!)
                return
            }

            DispatchQueue.main.async {
                cell.imageView?.image = UIImage(data: data!)
                tableView.reloadData()
            }

        }).resume()

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        booking.providerId = providerNameImageList[indexPath.row].id
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTime" {
            let vcTime = segue.destination as? TimeViewController
            vcTime?.booking = booking
        }
    }
}
