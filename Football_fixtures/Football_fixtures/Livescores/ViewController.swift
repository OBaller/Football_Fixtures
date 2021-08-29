//
//  ViewController.swift
//  Football_fixtures
//
//  Created by IBE on 25/08/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var gamesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gamesTableView.delegate = self
        gamesTableView.dataSource = self
        
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
                let result = String(data: data!, encoding: .utf8)
                print(result ?? "")
                // try to parse the data
                do {
                    
//                    let dictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
//                    print(dictionary)

                }
                catch {
                   print("Error parsing data")
                }
            }
            
        }
        // Fire off the datatask
        dataTask.resume()

    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
}

struct Fixtures: Decodable {
    var count: String?
//    var
}
