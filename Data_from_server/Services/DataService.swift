//
//  DataService.swift
//  Data_from_server
//
//  Created by Ivan Ivanov on 12.04.2020.
//  Copyright © 2020 Ivan Ivanov. All rights reserved.
//

import Foundation

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
            
            let weatherResponse = try? JSONDecoder().decode(ServerResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
    }
}
