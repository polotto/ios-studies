//
//  NetworkService.swift
//  Joker
//
//  Created by Angelo Polotto on 27/09/22.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
    //MARK: - fields
    private let timeoutIntervalSec = TimeInterval(60)
    
    //MARK: - protocol implementations
    func httpGet<T: Codable>(with responseObjectType: T.Type,
                             url: String, headers: [String: String],
                             completion: @escaping (Result<T>) -> Void) {
        createSessionRequest(with: .get, url: url, headers: headers, body: nil) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedObject = try JSONDecoder().decode(responseObjectType.self, from: data)
                    completion(.success(decodedObject))
                } catch let error {
                    completion(.failure(.jsonParsingError(error as! DecodingError)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func httpPost<T: Codable, R: Codable>(with responseObjectType: T.Type,
                                         url: String, headers: [String: String],
                                         body: R,
                                         completion: @escaping (Result<T>) -> Void) {
        do {
            let bodyJson = try JSONEncoder().encode(body)
            
            createSessionRequest(with: .post, url: url, headers: headers, body: bodyJson) { result in
                switch result {
                case .success(let data):
                    do {
                        let decodedObject = try JSONDecoder().decode(responseObjectType.self, from: data)
                        completion(.success(decodedObject))
                    } catch let error {
                        completion(.failure(.jsonParsingError(error as! DecodingError)))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
            
        } catch let error {
            completion(.failure(.jsonParsingError(error as! DecodingError)))
            return
        }
    }
    
    func httpGet<T: Codable>(with responseObjectType: T.Type,
                             url: String, headers: [String: String]) async throws -> T {
        let data = try await createSessionRequest(with: .get, url: url, headers: headers, body: nil)

        let decodedObject = try JSONDecoder().decode(responseObjectType.self, from: data)
        return decodedObject
    }
    
    func httpPost<T: Codable, R: Codable>(with responseObjectType: T.Type,
                              url: String, headers: [String: String],
                              body: R) async throws -> T {
        let bodyJson = try JSONEncoder().encode(body)
        
        let data = try await createSessionRequest(with: .get, url: url, headers: headers, body: bodyJson)
        
        let decodedObject = try JSONDecoder().decode(responseObjectType.self, from: data)
        return decodedObject
    }
    
    //MARK: - private methods
    private func createSessionRequest(with httpMethod: HttpMethod?,
                                     url: String, headers: [String: String], body: Data?) async throws -> Data {
        let dataURL = URL(string: url)!

        let session = URLSession.shared
        
        var request = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeoutIntervalSec)
        request.httpMethod = httpMethod?.rawValue ?? HttpMethod.get.rawValue
        
        for (key, value) in headers {
            request.setValue(key, forHTTPHeaderField: value)
        }
        
        let (data, _) = try await session.data(for: request)
        return data
    }
    
    private func createSessionRequest(with httpMethod: HttpMethod?,
                                                      url: String, headers: [String: String], body: Data?,
                                                      completion: @escaping (Result<Data>) -> Void) {
        guard let dataURL = URL(string: url) else {
            completion(.failure(.urlError))
            return
        }
        
        let session = URLSession.shared
        
        var request = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: timeoutIntervalSec)
        request.httpMethod = httpMethod?.rawValue ?? HttpMethod.get.rawValue
        
        for (key, value) in headers {
            request.setValue(key, forHTTPHeaderField: value)
        }
        
        request.httpBody = body
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            guard error == nil else {
                completion(.failure(.networkError(error!)))
                return
            }

            guard let data = data else {
                completion(.failure(.dataNotFound))
                return
            }
            
            completion(.success(data))
        })

        task.resume()
    }
}
