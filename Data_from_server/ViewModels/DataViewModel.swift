import Foundation
import Combine

class DataViewModel: ObservableObject {
    
    private var dataService: DataService!
    
    @Published var data = Data()
    
    init() {
        self.dataService = DataService()
    }
    
    var title: String {
        if let title = self.data.title {
            return title
        } else {
            return ""
        }
    }
    
     func fetchData() {
        self.dataService.getData(){ data in
            if let data = data {
                DispatchQueue.main.async {
                    self.data = data
                }
            }
        }
    }
}
