//
//  ViewController.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/10/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import UIKit

class ServicesViewController: UIViewController {

    @IBOutlet weak var nailTrimButton: UIButton!
    
    @IBOutlet weak var homeHealthCheckButton: UIButton!
    
    @IBOutlet weak var bunnyHopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nailTrimTapped(_ sender: UIButton) {
        print("Nail trims tapped")
    }
    
    @IBAction func homeHealthChecksTapped(_ sender: UIButton) {
        print("Home health checks tapped")
    }
    
    @IBAction func bunnyHopTapped(_ sender: UIButton) {
        print("Bunny Hop tapped")
    }
    
}

