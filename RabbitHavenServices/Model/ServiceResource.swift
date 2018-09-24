//
//  ServiceResource.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/22/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import Foundation

let baseUrl = "https://api.stackexchange.com/2.2"
let site = "site=stackoverflow"
let order = "order=desc"
let sorting = "sort=votes"
let tags = "tagged=ios"
let questionPath = "/questions"
let serviceUrl = baseUrl + questionPath + "?" + order + "&" + sorting + "&" + tags + "&" + site

struct ServiceResource: ApiResource {

    let methodPath = questionPath
    var url : URL = URL(string: serviceUrl)!
    
    func makeModel(data: Data) -> Services? {
        let decoder = JSONDecoder()
        guard let services = try? decoder.decode(Services.self, from: data) else {
            return nil
        }
        return services
    }
}
