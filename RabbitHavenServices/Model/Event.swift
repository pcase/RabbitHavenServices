//
//  Event.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/22/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import Foundation

struct Service {
    let name: String
    let description: String
    let id: String
    let duration: Int
    let price: Int
    let currency: String
    let picture: String
    let unit_map: [String]
    
    init() {
        self.name = ""
        self.description = ""
        self.id = ""
        self.duration = 0
        self.price = 0
        self.currency = ""
        self.picture = ""
        self.unit_map = []
    }
}

extension Service: Decodable {
    enum EventKeys: String, CodingKey {
        case name = "name"
        case description = "description"
        case id = "id"
        case duration = "duration"
        case price = "price"
        case currency = "currency"
        case picture = "picture"
        case unit_map = "unit_map"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: EventKeys.self)
        let name: String = try container.decode(String.self, forKey: .name)
        let description: String = try container.decode(String.self, forKey: .description)
        let id: String = try container.decode(String.self, forKey: .id)
        let duration: Int = try container.decode(Int.self, forKey: .duration)
        let price: Int = try container.decode(Int.self, forKey: .duration)
        let currency: String = try container.decode(String.self, forKey: .currency)
        let picture: String = try container.decode(String.self, forKey: .picture)
        let unit_map: [String] = try container.decode([String].self, forKey: .unit_map)
        
        self.init()
    }
}
