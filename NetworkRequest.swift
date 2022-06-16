//
//  NetworkRequest.swift
//  ScrollViewPractice
//
//  Created by Mayank on 12/06/22.
//

import Foundation

extension URLSession {
    
    enum CustomError: Error {
        case invalidURL
        case invalidData
    }
    
    func request<T: Codable>(
        url: URL?,
        expectedModel: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
        ){
        
            guard let url = url else {
                completion(.failure(CustomError.invalidURL))
                return
            }
            
            let task = dataTask(with: url) { data, _, error in
                
                guard let data = data else {
                    if let error = error {
                        completion(.failure(error))
                    }
                    else {
                        completion(.failure(CustomError.invalidData))
                    }
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(expectedModel, from: data)
                    completion(.success(result))
                }
                catch {
                    completion(.failure(error))
                }
                
            }
            task.resume()
    }
    
    
}
