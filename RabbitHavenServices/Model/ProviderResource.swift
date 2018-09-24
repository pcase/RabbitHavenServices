//
//  ProviderResource.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/22/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import Foundation

let providerUrl = baseUrl + questionPath + "?" + order + "&" + sorting + "&" + tags + "&" + site

struct ProviderResource: ApiResource {
    let methodPath = "/getUnitList"
    var url : URL = URL(string: providerUrl)!
    
    func makeModel(data: Data) -> Provider? {
        let decoder = JSONDecoder()
        guard let provider = try? decoder.decode(Provider.self, from: data) else {
            return nil
        }
        return provider
    }
}
