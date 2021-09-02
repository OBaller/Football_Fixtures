//
//  Standings.swift
//  Football_fixtures
//
//  Created by IBE on 01/09/2021.
//

import Foundation

class StandingsService {
    static let shared = StandingsService()
    
    func fetchLog(completion: @escaping ([Table], Error?) -> () ) {
        // URL
        let url = URL(string: "https://api.football-data.org/v2/competitions/2021/standings")
//        guard url != nil else {
//            print("error creating url object")
//            return
//        }
        guard let url = url else {
            return
        }
        print(url)
        // URL Request
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
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
                        JSONDecoder().decode(Standing.self, from: data)
                    
                    print(jsonDecoder.table)
                    
                    completion(jsonDecoder.table ?? [] , error)
                    
                } catch let jsonErr {
                    print("failed to decode json data", jsonErr)
                    completion([], error)
                }
            }
        }
        dataTask.resume()
        
    }
}
