//
//  Data.swift
//  Data_from_server
//
//  Created by Ivan Ivanov on 12.04.2020.
//  Copyright © 2020 Ivan Ivanov. All rights reserved.
//

import Foundation

struct ServerResponse: Decodable {
    
    var main: Data
    
}

struct Data: Decodable {
    
    var title: String?
    
}
