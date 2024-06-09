
import Foundation

class LoginViewModel: ObservableObject{
    var username: String = ""
    var password: String = ""
    @Published var isAuthenticated: Bool = false
    
    func login() {
        
        let defaults = UserDefaults.standard
        
        Webservice().login(jobNumber: username, password: password) { result in
            switch result{
                case .success(let token):
                defaults.setValue(token, forKey: "jsontoken")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
