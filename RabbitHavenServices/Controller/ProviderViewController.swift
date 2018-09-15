//
//  ProviderViewController.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/11/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import UIKit

class ProviderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var serviceDataModel = ServiceDataModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    let providers = [("Bridgitte"), ("bunnyhop"), ("Debbie"), ("James"), ("Jennifer"), ("Kyomi"), ("Vicki"), ("anyprovider")]
    
    let providersImages = [UIImage(named: "bridgitte.png"), UIImage(named: "bunnyhop.png"), UIImage(named: "debbie.png"), UIImage(named: "james.png"), UIImage(named: "jennifer.png"), UIImage(named: "kyomi.png"), UIImage(named: "vicki.png"), UIImage(named: "anyprovider.png")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Datasource functions

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return providers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath)
        cell.textLabel?.text = providers[indexPath.row]
        cell.imageView?.image = providersImages[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTime" {
            let vcTime = segue.destination as? TimeViewController
            vcTime?.serviceDataModel = serviceDataModel
        }
    }
}
