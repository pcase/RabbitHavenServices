//
//  Token.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/23/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import Foundation

struct Token: Codable {
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

//extension Token: {
//    enum TokenKeys: String, CodingKey {
//        case id = "id"
//        case result = "result"
//        case jsonrpc = "jsonrpc"
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: TokenKeys.self)
//        let id: String = try container.decode(String.self, forKey: .id)
//        let result: String = try container.decode(String.self, forKey: .result)
//        let jsonrpc: String = try container.decode(String.self, forKey: .jsonrpc)
//        
//        self.init()
//    }
//}
