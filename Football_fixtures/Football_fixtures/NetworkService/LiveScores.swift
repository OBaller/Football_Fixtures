//
//  NetworkService.swift
//  Football_fixtures
//
//  Created by IBE on 28/08/2021.
//

import Foundation

class LiveScoreService {
    static let shared = LiveScoreService()
    
    func fetchData(completion: @escaping ([Match], Error?) -> () ) {
        // URL
        let url = URL(string: "https://api.football-data.org/v2/matches")
        guard url != nil else {
            print("error creating url object")
            return
        }
        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        let header = ["X-Auth-Token": "cc63bac0567b4b2ea211821801cdc961", "accept": "string", "content-type": "application/json"]
        request.allHTTPHeaderFields = header
        request.httpMethod = "GET"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if error == nil && data != nil {
                guard let data = data else {return}
                do {
                    let jsonDecoder = try
                        JSONDecoder().decode(DataModel.self, from: data)
                    //  print(jsonDecoder)
                    completion(jsonDecoder.matches , nil)
                } catch let jsonErr {
                    print("failed to decode json data", jsonErr)
                    completion([], nil)
                }
            }
            
        }
        dataTask.resume()
    }
    
}
