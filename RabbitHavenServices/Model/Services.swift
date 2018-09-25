//
//  Services.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/24/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import Foundation

struct Services: Decodable {
    let id: String
    let result:[String:Service]
    let jsonrpc: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case result = "result"
        case jsonrpc = "jsonrpc"
    }
}

struct Service: Codable {
    //    let file_id: String
    let picture_path: String
    let price_without_tax: Int
    let name: String
    //    let hide_duration: String
    //    let is_recurring: String
    //    let is_active: String
    //    let price_with_tax: Int
    //    let classes_plugin_info: [String:String]
    let description: String
    let price: String
//    let position: String
    let picture: String
    //    let show_tax: Bool
//    let is_public: String
    //    let buffertime_before: String
    let currency: String
    //    let buffertime_after: String
    let id: String
    let unit_map: [String:String?] = [" ": nil]
    //    let is_visible: String
//    let seo_url: String?
    let duration: String
    let picture_sub_path: String
    
    enum CodingKeys: String, CodingKey {
        //        case file_id = "file_id"
        case picture_path = "picture_path"
        case price_without_tax = "price_without_tax"
        case name = "name"
        //        case hide_duration = "hide_duration"
        //        case is_recurring = "is_recurring"
        //        case is_active = "is_active"
        //        case price_with_tax = "price_with_tax"
        //        case classes_plugin_info = "classes_plugin_info"
        case description = "description"
        case price = "price"
//        case position = "position"
        case picture = "picture"
        //        case show_tax = "show_tax"
        //        case is_public = "is_public"
        //        case buffertime_before = "buffertime_before"
        case currency = "currency"
        //        case buffertime_after = "buffertime_after"
        case id = "id"
        case unit_map = "unit_map"
        //        case is_visible = "is_visible"
//        case seo_url = "seo_url"
        case duration = "duration"
        case picture_sub_path = "picture_sub_path"
    }
    
    //    init(from decoder: Decoder) {
    //        file_id = ""
    //        picture_path = ""
    //        price_without_tax = 0
    //        name = ""
    //        hide_duration = ""
    //        is_recurring = ""
    //        is_active = ""
    //        price_with_tax = 0
    //        classes_plugin_info = [:]
    //        description = ""
    //        price  = ""
    //        position = ""
    //        picture = ""
    //        show_tax = false
    //        is_public = ""
    //        buffertime_before = ""
    //        currency = ""
    //        buffertime_after = ""
    //        id = ""
    //        unit_map = [:]
    //        is_visible = ""
    //        seo_url = ""
    //        duration = ""
    //        picture_sub_path = ""
    //   }
}
