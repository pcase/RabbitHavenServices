//
//  Service.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/17/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import Foundation
import RealmSwift

class Service: Object {
    @objc dynamic var name  : String = ""
    @objc dynamic var detail : String = ""
    @objc dynamic var image : String = ""
    @objc dynamic var price : Int = 0
    @objc dynamic var priceCurrency : String = ""
}
