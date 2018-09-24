//
//  ApiResource.swift
//  RabbitHavenServices
//
//  Created by Patty Case on 9/22/18.
//  Copyright © 2018 Azure Horse Creations. All rights reserved.
//

import Foundation

protocol ApiResource {
    associatedtype Model: Decodable
    var methodPath: String { get }
    var url: URL { get }
    func makeModel(data: Data) -> Model
}
