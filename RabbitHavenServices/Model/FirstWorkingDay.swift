//
//  FirstWorkingDay.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 10/10/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import Foundation

struct FirstWorkingDay: Codable {
    let id: String
    let result: String
    let jsonrpc: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case result = "result"
        case jsonrpc = "jsonrpc"
    }
    
    init() {
        self.id = ""
        self.result = ""
        self.jsonrpc = ""
    }
}
