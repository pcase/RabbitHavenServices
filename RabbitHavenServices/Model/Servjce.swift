//
//  Servjce.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/22/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import Foundation

struct Services: Codable {
        struct Service: Codable {
            struct User: Codable {
                let name: String?
                let profileImageURL: URL?
                let reputation: Int?
                
                enum CodingKeys: String, CodingKey {
                    case reputation
                    case name = "display_name"
                    case profileImageURL = "profile_image"
                }
            }
            let title: String
            let score: Int
            let tags: [String]
            let date: Date
            let owner: User?
            
            enum CodingKeys: String, CodingKey {
                case title
                case score
                case tags
                case owner
                case date = "creation_date"
            }
        }
        public let items: [Service]
    }
