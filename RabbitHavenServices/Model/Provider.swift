//
//  Provider.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/22/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import Foundation

struct Provider {
    let id: Int
    let name: String
    let description: String
    let event_map: [String]
    
    init() {
        self.id = 0
        self.name = ""
        self.description = ""
        self.event_map = []
    }
}

extension Provider: Decodable {
    enum ProviderKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case event_map = "event_map"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ProviderKeys.self)
        let id: String = try container.decode(String.self, forKey: .id)
        let name: String = try container.decode(String.self, forKey: .name)
        let description: String = try container.decode(String.self, forKey: .description)
        let event_map: [String] = try container.decode([String].self, forKey: .event_map)
        
        self.init()
    }
}
