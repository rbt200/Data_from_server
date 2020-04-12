//
//  ContentView.swift
//  Data_from_server
//
//  Created by Ivan Ivanov on 12.04.2020.
//  Copyright © 2020 Ivan Ivanov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var dataVM: DataViewModel
    
    init() {
        self.dataVM = DataViewModel()
        self.dataVM.fetchData()
    }
    
    var body: some View {
        VStack {
            Text(self.dataVM.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
