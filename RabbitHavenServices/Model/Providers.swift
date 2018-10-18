//
//  Providers.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/25/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import Foundation

struct Providers: Decodable {
    let id: String
    let result:[String:Provider]
    let jsonrpc: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case result = "result"
        case jsonrpc = "jsonrpc"
    }
}

struct Provider: Codable {
    //    let file_id: String
    let picture_path: String
    let name: String
    //    let station_id: String
    //    let email: String
    //    let qty: String
    //    let is_active: String
    let event_map: [String:String?]
    let description: String
    //    let classes_plugin_info: [String:String]
    //    let user: Bool
//    let position: String?
    let picture: String?
    let id: String
    let services: [String:String?]
//    let phone: String
//    let is_visible: String
    //    let seo_url: String?
//        let picture_sub_path: String

    enum CodingKeys: String, CodingKey {
        //        case file_id = "file_id"
        case picture_path = "picture_path"
        case name = "name"
        //        case let station_id = "let station_id"
        //        case email = "email"
        //        case qty = "qty"
        //        case is_active = "is_active"
        case event_map = "event_map"
        case description = "description"
//        case classes_plugin_info = "classes_plugin_info"
//        case user = false
        //        case position = "position"
        case picture = "picture"
        case id = "id"
        case services = "services"
//        case phone = "phone"
//        case is_visible = "is_visible"
//        case seo_url = "seo_url"
//        case picture_sub_path = "picture_sub_path"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.picture_path = try values.decode(String.self, forKey: .picture_path)
        self.name = try values.decode(String.self, forKey: .name)
        self.description = try values.decode(String.self, forKey: .description)
        self.picture = try values.decode(String.self, forKey: .picture)
        self.id = try values.decode(String.self, forKey: .id)
        
        var event_items: [String: Any] = [:]
        var event_dict: [String:String] = [:]
        do {
            event_items = try values.decode([String:String?].self, forKey: .event_map) as! [String: Any]
            for key in event_items.keys {
                event_dict[key] = ""
            }
        } catch {
            print("INFO: provider does not use event_map")
        }
        self.event_map = event_dict
        
        var service_items: [String: Any] = [:]
        var service_dict: [String:String] = [:]
        do {
            service_items = try values.decode([String:String?].self, forKey: .event_map) as! [String: Any]
            for key in service_items.keys {
                service_dict[key] = ""
            }
        } catch {
            print("INFO: provider does not use services")
        }
        self.services = service_dict
    }
}
