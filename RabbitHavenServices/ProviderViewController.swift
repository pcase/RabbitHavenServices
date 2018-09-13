//
//  ProviderViewController.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/11/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import UIKit

class ProviderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var photo: UIImageView!
    
    let providers = [("Bridgitte"), ("bunnyhop"), ("Debbie"), ("James"), ("Jennifer"), ("Kyomi"), ("Vicki")]
    let providersImages = [UIImage(named:"Bridgitte.png"), UIImage(named:"bunnyhop.png"), UIImage(named:"Debbie.png"), UIImage(named:"James.png"), UIImage(named:"Jennifer.png"), UIImage(named:"Kyomi.png"), UIImage(named:"Vicki.png")]
    let providersImagesNames = ["bridgitte", "bunnyhop", "debbie", "james", "jennifer", "kyomi", "vicki"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Datasource functions

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return providers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:CustomTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! CustomTableViewCell
        cell.textLabel?.text = self.providers[indexPath.row]
        cell.photo?.image = UIImage(named:self.providersImagesNames[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Hint", message: "You have selected row \(indexPath.row)", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction)
        
        present(alertController, animated: true, completion: nil)
    }

}
