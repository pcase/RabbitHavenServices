//
//  ProviderResource.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/22/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import Foundation

struct ProviderResource: ApiResource {
    let methodPath = "/getUnitList"
    
    func makeModel(data: Data) -> Provider? {
        let decoder = JSONDecoder()
        guard let provider = try? decoder.decode(Provider.self, from: data) else {
            return nil
        }
        return provider
    }
}
