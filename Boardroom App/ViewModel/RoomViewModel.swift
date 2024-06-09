
import Foundation

class RoomViewModel: ObservableObject {
    @Published var BoardRoom: [RoomModel] = []
    
    func fetch() {
        print("hiii")
//        guard let url = URL(string:"https://api.airtable.com/v0/appLz0XN14sqwEYBd/Boardrooms")  else {
//            return
//        }
        guard let url = URL(string:"https://api.airtable.com/v0/appLz0XN14sqwEYBd/Boardrooms")  else {
          //  completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
       // let body = EmpModel(id: jobNumber, name: "", job_title: "", password: password)
        
        var request = URLRequest(url: url)
        request.setValue("Bearer patgMpQwwqWdjp4RA.64a7f4a74bc937a7aba955dd2c96039c1f613273ace9cab2df3dee11b436e37f", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) {[weak self] data , _, error in
            guard let data = data, error == nil else {
                return
            }
            //convert
            print(String(data: data, encoding: .utf8),"😀")
            do {
                
                let boardRoom = try JSONDecoder().decode(RoomModel2.self, from: data)
                DispatchQueue.main.async {
                    self?.BoardRoom = boardRoom.records
                    print(boardRoom.records.count,"😀")
                }
            }
            catch{
                print("Error in Do/Catch: \(error)")
            }
        }
        task.resume()
    }
    
}

//    func BoardroomTable() async throws -> RoomModel {
//        let endpoint = "https://api.airtable.com/v0/appLz0XN14sqwEYBd/Boardrooms"
//        
//        guard let url = URL(string: endpoint) else {
//            throw APIError.invalidURL
//        }
//        
//        let (data, response) = try await URLSession.shared.data(from: url)
//        
//        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//            throw APIError.invalidResponse
//        }
//        
//        do {
//            let decoder = JSONDecoder()
//            decoder.keyDecodingStrategy = .convertFromSnakeCase
//            return try decoder.decode(RoomModel.self, from: data)
//        } catch {
//            throw APIError.invalidData
//        }
//    }

