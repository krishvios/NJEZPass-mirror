
import Foundation
import Alamofire

enum APIRouter: APIConfiguration {
    
    // MARK: - Use Cases
    case login(email:String, password:String)
    case posts
    case post(id: Int)
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .posts, .post:
            return .get
        }
    }
    
    // MARK: - Path
    var path: String {
        switch self {
        case .login:
            return "/oauth/token"
        case .posts:
            return "/posts"
        case .post(let id):
            return "/posts/\(id)"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .login(let email, let password):
            return [K.APIParameterKey.grantType: "password", K.APIParameterKey.clientId: "NJ_EZ_Pass", K.APIParameterKey.clientSecret : "N4pBHuCUgw8D2BdZtSMX2jexxw3tp7", K.APIParameterKey.agencyID : "1", K.APIParameterKey.loginType : "username", K.APIParameterKey.value : email, K.APIParameterKey.password : password]
          /*
            grant_type=password&
            client_id=NJ_EZ_Pass&
            client_secret=N4pBHuCUgw8D2BdZtSMX2jexxw3tp7&
            agencyID=1&
            loginType=username&
            value=peapods&
            password=Welcome1
             
             {"loginType":"username","password":"Welcome1","client_id":"NJ_EZ_Pass","grant_type":"password","client_secret":"N4pBHuCUgw8D2BdZtSMX2jexxw3tp7","agencyID":"1","value":"peapods"}
        */
        case .posts, .post:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try K.QAServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.urlEncoded.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                 urlRequest = try URLEncoding.httpBody.encode(urlRequest, with: parameters)

//                urlRequest.httpBody = URLEncoding.//JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        
        return urlRequest
    }
}
