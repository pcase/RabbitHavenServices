//
//  NetworkController.swift
//  RabbitHavenServices
//
//  Created by Matteo Manferdini on 25/05/2017.
//  Copyright © 2017 Pure Creek. All rights reserved.
//

import Foundation

class NetworkController1 {
    func loadServices(withCompletion completion: @escaping (Services?) -> Void) {
        let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: OperationQueue.main)
        let url = URL(string: "https://api.stackexchange.com/2.2/questions?order=desc&sort=votes&site=stackoverflow")!
        let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data else {
                completion(nil)
                return
            }
            guard let json = try? JSONDecoder().decode(Services.self, from: data) else {
                completion(nil)
                return
            }
            completion(json)
        })
        task.resume()
    }
}

class NetworkController {
    func load(_ urlString: String, withCompletion completion: @escaping ([Any]?) -> Void) {
    let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: OperationQueue.main)
    let url = URL(string: urlString)!
    let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
        guard data != nil else {
            completion(nil)
            return
        }
        let result: [Any]
        result = []
        completion(result)
    })
    task.resume()
    }
}
