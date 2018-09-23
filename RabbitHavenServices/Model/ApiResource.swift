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
    func makeModel(data: Data) -> Model
}

extension ApiResource {
    var url: URL {
        let baseUrl = "https://api.stackexchange.com/2.2"
        let site = "site=stackoverflow"
        let order = "order=desc"
        let sorting = "sort=votes"
        let tags = "tagged=ios"
        let url = baseUrl + methodPath + "?" + order + "&" + sorting + "&" + tags + "&" + site
        return URL(string: url)!
    }
}
