//
//  Utils.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/15/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import Foundation

class Utils {
    
    static func intToString(num: Int) -> String {
        return String(num)
    }
    
    static func floatToString(num: Float) -> String {
        return String(format: "%.2f", Float(num))
    }
}
