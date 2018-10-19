//
//  ProviderViewController.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/11/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import UIKit
import SVProgressHUD

class ProviderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var booking = Booking()
    var providerDictionary: [String:Provider] = [:]
    var task: URLSessionDownloadTask!
    var session: URLSession!
    var cache:NSCache<AnyObject, AnyObject>!
    
    @IBOutlet weak var tableView: UITableView!
    
    struct ProviderNameImage {
        let name: String
        let imagePath: String
        let id: String
    }

    var providerNameImageList = [ProviderNameImage]()
    var providerImageList = [UIImage]()
    
    func mapProviderDictionaryToStruct(dictionary:  [String:Provider]) -> [ProviderNameImage] {
        var arr = [ProviderNameImage]()
        var providerNameImage: ProviderNameImage

        for (_, value) in dictionary {
            providerNameImage = ProviderNameImage.init(name: value.name, imagePath: Constants.HOST + value.picture_path, id: value.id)
            arr.append(providerNameImage)
        }

        return arr
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cache = NSCache()
        session = URLSession.shared
        task = URLSessionDownloadTask()
        tableView.dataSource = self
        tableView.delegate = self
        
        providerNameImageList = mapProviderDictionaryToStruct(dictionary: providerDictionary)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        booking.providerId = providerNameImageList[indexPath.row].id
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTime" {
            let vcTime = segue.destination as? TimeViewController
            vcTime?.booking = booking
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath)
        cell.textLabel?.text = providerNameImageList[indexPath.row].name
        cell.imageView?.image = UIImage(named: "placeholder")
        
        if (self.cache.object(forKey: (indexPath as NSIndexPath).row as AnyObject) != nil){

            // Image is cached
            cell.imageView?.image = self.cache.object(forKey: (indexPath as NSIndexPath).row as AnyObject) as? UIImage
            
        } else {
            // Download image
            SVProgressHUD.show()
            let imageUrl = providerNameImageList[indexPath.row].imagePath
            let url:URL! = URL(string: imageUrl)
            task = session.downloadTask(with: url, completionHandler: { (location, response, error) -> Void in
                if let data = try? Data(contentsOf: url){
                    DispatchQueue.main.async(execute: { () -> Void in
                        SVProgressHUD.dismiss()
                        if let updateCell = tableView.cellForRow(at: indexPath) {
                            let img:UIImage! = UIImage(data: data)
                            updateCell.imageView?.image = img
                            self.cache.setObject(img, forKey: (indexPath as NSIndexPath).row as AnyObject)
                        }
                    })
                }
            })
            task.resume()
        }
        return cell
    }
}
