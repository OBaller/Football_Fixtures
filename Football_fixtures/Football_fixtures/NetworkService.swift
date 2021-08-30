//
//  NetworkService.swift
//  Football_fixtures
//
//  Created by IBE on 28/08/2021.
//

import Foundation

class Service {
    static let shared = Service()
    
    func fetchData(completion: @escaping ([Match], Error?) -> () ) {
        // URL
        let url = URL(string: "https://api.football-data.org/v2/matches")
        guard url != nil else {
            print("error creating url object")
            return
        }
        // URL Request
        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        // Specify the header
        let header = ["X-Auth-Token": "cc63bac0567b4b2ea211821801cdc961", "accept": "string", "content-type": "application/json"]
        request.allHTTPHeaderFields = header
        // Specify the body
        
        // Set the request type
        request.httpMethod = "GET"
        // Get the URLSession
        let session = URLSession.shared
        // Create the datatask
        let dataTask = session.dataTask(with: request) { data, response, error in
            // check for errors
            if error == nil && data != nil {
                // try to parse the data
                
                guard let data = data else {return}
                do {
                    let jsonDecoder = try
                        JSONDecoder().decode(DataModel.self, from: data)
                    
                    print(jsonDecoder.matches)
                
                    completion(jsonDecoder.matches , nil)
                    
                } catch let jsonErr {
                    print("failed to decode json data", jsonErr)
                    completion([], nil)
                }
            }

        }
        // Fire off the datatask
        dataTask.resume()

    }
    
    
    func fetchLeagues(completion: @escaping (Competition?, Error?) -> () ) {
        // URL
        let url = URL(string: "https://api.football-data.org/v2/matches")
        guard url != nil else {
            print("error creating url object")
            return
        }
        // URL Request
        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        // Specify the header
        let header = ["X-Auth-Token": "cc63bac0567b4b2ea211821801cdc961", "accept": "string", "content-type": "application/json"]
        request.allHTTPHeaderFields = header
        request.httpMethod = "GET"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if error == nil && data != nil {
                guard let data = data else {return}
                do {
                    let jsonDecoder = try
                        JSONDecoder().decode(Competition.self, from: data)
                    
                    print(jsonDecoder.name)
                
                    completion(jsonDecoder, error)
                    
                } catch let jsonErr {
                    print("failed to decode json data", jsonErr)
                    completion(nil, error)
                }
            }
        }
        dataTask.resume()

    }
}
