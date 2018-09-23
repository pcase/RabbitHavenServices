//
//  ServiceResource.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/22/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import Foundation

struct ServiceResource: ApiResource {
    let methodPath = "/questions"
    
    func makeModel(data: Data) -> Services? {
        let decoder = JSONDecoder()
        guard let services = try? decoder.decode(Services.self, from: data) else {
            return nil
        }
        return services
    }
}
