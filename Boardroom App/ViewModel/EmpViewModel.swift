

import Foundation

class Webservice {
        
        func login(jobNumber: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void ){
        
            guard let url = URL(string:" https://api.airtable.com/v0/appLz0XN14sqwEYBd/Employee")  else {
                completion(.failure(.custom(errorMessage: "URL is not correct")))
                return 
            }
            let body = EmpModel(id: jobNumber, name: "", job_title: "", password: password)
            
            var request = URLRequest(url: url)
            request.setValue("Bearer patgMpQwwqWdjp4RA.64a7f4a74bc937a7aba955dd2c96039c1f613273ace9cab2df3dee11b436e37f", forHTTPHeaderField: "Authorization")
            request.httpMethod = "Post"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONEncoder().encode(body)
            
            URLSession.shared.dataTask(with: request){ (data, response, error) in
                
                guard let data = data, error == nil else {
                    completion(.failure(.custom(errorMessage:"No Data")))
                    return
                }
                
                guard let LoginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                    completion(.failure(.invalidCredentials))
                    return
                }
                
                guard let token = LoginResponse.token else {
                    completion(.failure(.invalidCredentials))
                    return
                }
                
                completion(.success(token))
                
            }.resume()
    }
}
