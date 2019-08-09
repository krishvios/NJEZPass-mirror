//
//  APIManager.swift
//  CMAA
//
//  Created by Latha, Sowjanya on 02/05/19.
//  Copyright © 2019 cnd. All rights reserved.
//

import UIKit
import Alamofire
import Entities
import Domain
class APIService: IAPIServicable {
    private var baseURL: String = ""
    private var sslHashKey: String = ""
    static let shared = APIService(baseURL: APIConstants.HostUrl.qaUrl)
    private let sessionManager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = TimeInterval(120)
        configuration.timeoutIntervalForResource = TimeInterval(120)
        return Alamofire.SessionManager(configuration: configuration)
    }()
    private lazy var urlSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = TimeInterval(120)
        configuration.timeoutIntervalForResource = TimeInterval(120)
        let session = URLSession(configuration: configuration)//, delegate: self, delegateQueue: nil)
        return session
    }()
    required init(baseURL: String) {
        self.baseURL = baseURL
    }
    internal func setAPIHostEnvironment(enviroment: APIConstants.APIHostEnvironment) {
        switch enviroment {
        case .dev:
            sslHashKey = APIConstants.HTTPStrings.qaHashKey
            baseURL = APIConstants.HostUrl.devURL
        case .qa:
            sslHashKey = APIConstants.HTTPStrings.qaHashKey
            baseURL = APIConstants.HostUrl.qaUrl
        case .prod:
            sslHashKey = APIConstants.HTTPStrings.prodHashKey
            baseURL = APIConstants.HostUrl.prodUrl
        case .demo:
            sslHashKey = APIConstants.HTTPStrings.qaHashKey
            baseURL = APIConstants.HostUrl.demoUrl
        case .local:
            sslHashKey = APIConstants.HTTPStrings.qaHashKey
            baseURL = APIConstants.HostUrl.local
        }
    }
    
    func requestAPIWithURLSession<Req: Codable, Res: Codable>(request: APIRequest<Req>, decodingType: Res.Type, completion: ((APIResponse<Res>) -> Void)?) {
        let baseUrl: String = "https://maas-test.services.conduent.com/oauth/token"////self.baseURL + "/\(request.url)"
        print("url: \(baseUrl)")
        guard HTTPMethod(rawValue: request.method.rawValue) != nil else {
            completion?(APIResponse.onFailure(error: APIError.general(error: nil)))
            return
        }
        guard let url = URL(string: baseUrl) else {
            completion?(APIResponse.onFailure(error: APIError.general(error: nil)))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        print("method:\(String(describing: urlRequest.httpMethod))")
        //        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let headers = request.headers {
            for (key, value) in headers {
                print("Key: '\(key)' val '\(value)'.")
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        if let requestBody = request.params {
            let jsonEncoder = JSONEncoder()
            let inputData = try? jsonEncoder.encode(requestBody)
            urlRequest.httpBody = inputData
            print("request: ", String(data: inputData!, encoding: .utf8))
        }
        if let multiPartImage = request.multiPartImageDict {
            let boundry = generateBoundaryString()
            urlRequest.setValue("multipart/form-data; boundary=\(boundry)", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = createBody(with: request.mutliParamsDict, imageDictionary: multiPartImage, boundary: boundry)
        }
        let task = urlSession.dataTask(with: urlRequest, completionHandler: {(data, response, error)   in
            print("response: \(String.init(data: data!, encoding: .utf8)!), err: \(error) , response: \(response)")
            let httpResponse = response as? HTTPURLResponse
            if let err = error {
                completion?(APIResponse.onFailure(error: APIError.general(error: err)))
            }
            if let responseData = data, let response = httpResponse {
                    switch response.statusCode {
                    case 200:
                        let decoder = JSONDecoder()
                        if let responseObj = try? decoder.decode(Res.self, from: responseData) {
                            completion?(APIResponse.onSuccess(value: responseObj))
                        } else {
                            let error = NSError(domain: "\(APIConstants.ServiceNames.loginUser)", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unable to create json param body"])
                            completion?(APIResponse.onFailure(error: APIError.general(error: error)))
                        }
                    case 201...500:
                        print("statusCode: ", response.statusCode)
                        let error = NSError(domain: "\(APIConstants.ServiceNames.loginUser)", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error from server"])
                        completion?(APIResponse.onFailure(error: APIError.general(error: error)))
                    default:
                        print("response not handled in block")
                    }
            }
        })
        task.resume()
    }
    func requestAPI<Req: Codable, Res: Codable>(request: APIRequest<Req>, decodingType: Res.Type, completion: ((APIResponse<Res>) -> Void)?) {
        if request.multiPartImageDict != nil {
            requestMuliPartAPI(request: request, decodingType: decodingType, completion: completion)
            return
        }
        let baseUrl: String = "https://maas-test.services.conduent.com/oauth/token"//self.baseURL + "/\(request.url)"
        guard HTTPMethod(rawValue: request.method.rawValue) != nil else {
            completion?(APIResponse.onFailure(error: APIError.general(error: nil)))
            return
        }
        guard let url = URL(string: baseUrl) else {
            completion?(APIResponse.onFailure(error: APIError.general(error: nil)))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        print("method:\(String(describing: urlRequest.httpMethod))")
        //        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if let headers = request.headers {
            for (key, value) in headers {
                if request.multiPartImageDict != nil && key == APIConstants.APIHeaderTypes.contentTypeHeader {
                    //Don't add content type header
                } else {
                    urlRequest.setValue(value, forHTTPHeaderField: key)
                }
            }
        }
        if let requestBody = request.params {
            let jsonEncoder = JSONEncoder()
            let inputData = try? jsonEncoder.encode(requestBody)
            urlRequest.httpBody = inputData
            print("request: ", String(data: inputData!, encoding: .utf8)!)
        }
        sessionManager.request(urlRequest)
            .validate(statusCode: 200...500)
            .responseData(completionHandler: { response in
                print("response: ", response.result, " ", response.response?.statusCode, urlRequest, " , ", response.debugDescription)
                switch response.result {
                case .success(let data):
                    if let statusCode = response.response?.statusCode {
                        switch statusCode {
                        case 200:
                            let decoder = JSONDecoder()
                            if let responseObj = try? decoder.decode(Res.self, from: data) {
                                completion?(APIResponse.onSuccess(value: responseObj))
                            } else {
                                let error = NSError(domain: "\(APIConstants.ServiceNames.loginUser)", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unable to create json param body"])
                                completion?(APIResponse.onFailure(error: APIError.general(error: error)))
                            }
                        case 201...500:
                            print("statusCode: ", statusCode)
                            let error = NSError(domain: "\(APIConstants.ServiceNames.loginUser)", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error from server"])
                            completion?(APIResponse.onFailure(error: APIError.general(error: error)))
                        default:
                            print("response not handled in block")
                        }
                    }
                case .failure(let error):
                    if let err = error as? URLError, case .notConnectedToInternet = err.code {
                        let errorAPI = APIError.noNetwork(error: error)
                        completion?(APIResponse.onFailure(error: errorAPI))
                    } else {
                        let errorAPI = APIError.general(error: error)
                        completion?(APIResponse.onFailure(error: errorAPI))
                    }
                }
            })
    }
    func requestMuliPartAPI<Req: Codable, Res: Codable>(request: APIRequest<Req>, decodingType: Res.Type, completion: ((APIResponse<Res>) -> Void)?) {
        let baseUrl: String = "https://maas-test.services.conduent.com/oauth/token"//self.baseURL + "/\(request.url)"
        guard let method = HTTPMethod(rawValue: request.method.rawValue), let url = URL(string: baseUrl) else {
            completion?(APIResponse.onFailure(error: APIError.general(error: nil)))
            return
        }
        Alamofire.upload( multipartFormData: {multipartFormData in
            if let multiPartParams = request.mutliParamsDict {
            for (key, value) in multiPartParams {
                multipartFormData.append(value.data(using: .utf8)!, withName: key)
            }
            }
            if let multiPartImageList = request.multiPartImageDict {
                for data in multiPartImageList {
                    multipartFormData.append(data.data, withName: data.key, fileName: data.fileName, mimeType: data.mimeType.rawValue)
                }
            }
        }, to: url, method: method, headers: request.headers) { (result) in
            switch result {
            case .success(let upload, _, _):
                upload.responseData { response in
                    print(response)
                    switch response.result {
                    case .success(let data):
                        if let statusCode = response.response?.statusCode {
                            switch statusCode {
                            case 200:
                                let decoder = JSONDecoder()
                                if let responseObj = try? decoder.decode(Res.self, from: data) {
                                    completion?(APIResponse.onSuccess(value: responseObj))
                                } else {
                                    let error = NSError(domain: "\(APIConstants.ServiceNames.loginUser)", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unable to create json param body"])
                                    completion?(APIResponse.onFailure(error: APIError.general(error: error)))
                                }
                            case 201...500:
                                print("statusCode: ", statusCode)
                                let error = NSError(domain: "\(APIConstants.ServiceNames.loginUser)", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error from server"])
                                completion?(APIResponse.onFailure(error: APIError.general(error: error)))
                            default:
                                print("response not handled in block")
                            }
                        }
                    case .failure(let error):
                        if let err = error as? URLError, case .notConnectedToInternet = err.code {
                            let errorAPI = APIError.noNetwork(error: error)
                            completion?(APIResponse.onFailure(error: errorAPI))
                        } else {
                            let errorAPI = APIError.general(error: error)
                            completion?(APIResponse.onFailure(error: errorAPI))
                        }
                    }
                }
            case .failure(let encodingError):
                completion?(APIResponse.onFailure(error: APIError.general(error: encodingError)))
            }
        }
    }
}

// MARK: Multipart Request implementation
extension APIService {
    private func createBody(with parameters: [String: Any]?, imageDictionary: [MultiPartDataInfo], boundary: String) -> Data {
        var body = Data()

        if parameters != nil {
            for (key, value) in parameters! {
                body.append(string: "--\(boundary)\r\n")
                body.append(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.append(string: "\(value)\r\n")
            }
        }
        for imageDict in imageDictionary {

            let fileName = imageDict.fileName//imageDict["extensionType"]!
            let extensionName  = imageDict.mimeType.rawValue//imageDict["extension"]!
            body.append(string: "--\(boundary)\r\n")
            body.append(string: "Content-Disposition: form-data; name=\"\(fileName)\"; filename=\"\(fileName)\"\r\n")
            body.append(string: "Content-Type: \(extensionName )\r\n\r\n")
            body.append(imageDict.data)//(imageDict["image"] as! Data)
            body.append(string: "\r\n")
        }

        body.append(string: "--\(boundary)--\r\n")
        return body
    }
    func generateBoundaryString() -> String {
        return "Boundary-\(UUID().uuidString)"
    }
}
