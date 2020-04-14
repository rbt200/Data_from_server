//
//  DataService.swift
//  Data_from_server
//
//  Created by Ivan Ivanov on 12.04.2020.
//  Copyright © 2020 Ivan Ivanov. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    func getData(completion: @escaping (Data?) -> ()) {
        guard let url = URL(string: "https://my-json-server.typicode.com/rbt200/fake_data_database") else {
        // guard let url = URL(string: "https://my-json-server.typicode.com/typicode/demo") else {
        //guard let url = URL(string: "http://openweathermap.org/data/2.5/weather?q=London&appid=439d4b804bc8187953eb36d2a8c26a02") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let dataResponse = try? JSONDecoder().decode(ServerResponse.self, from: data)
            if let dataResponse = dataResponse {
                let data = dataResponse.main
                completion(data)
            } else {
                completion(nil)
            }
        }.resume()
    }
}

class DataDropBox {
    
    func getJsonFromUrl() {
        //let url = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        let url = "https://my-json-server.typicode.com/rbt200/fake_data_database/db"
        //https://github.com/rbt200/fake_data_database/blob/master/db.json
        
        URLSession.shared.dataTask(with:  URL(string: url)!) { (data, res, err) in
            if let d = data {
                if let value = String(data: d, encoding: String.Encoding.ascii) {
                    if let jsonData = value.data(using: String.Encoding.utf8) {
                        do {
                            let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
                            if let arr = json["comments"] as? [[String: Any]] {
                                debugPrint(arr)
                                debugPrint(arr[1])
                                debugPrint(arr[2])
                                //debugPrint(arr[3])
                            }
                        } catch {
                            NSLog("ERROR \(error.localizedDescription)")
                        }
                    }
                }
            }
        }
    .resume()
    }
}
