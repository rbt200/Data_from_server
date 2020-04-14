import Foundation
import Combine

class DataViewModel: ObservableObject {
    
    private var dataService: DataService!
    private var dropBoxService: DataDropBox!
    
    @Published var data = Data()
    @Published var dropBox = DataDropBox()
    
    init() {
        self.dataService = DataService()
        self.dropBoxService = DataDropBox()
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
    
    func fetchDropBoxData() {
        self.dropBoxService.getJsonFromUrl()
    }
}
