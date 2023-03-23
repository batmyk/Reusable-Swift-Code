//
//  APICallCombine.swift
//  CombineBasics
//
//  Created by Mayank on 21/03/23.
//

import Foundation
import Combine

class APICall {
    
    var cancellables = [AnyCancellable]()
    
    func fetchNews(urlText: String, timeInterval: TimeInterval) -> Future<NewsModel, Error> {
        
        return Future<NewsModel, Error> { [weak self] promise in
            guard let strongSelf = self else { return }
            
            if let url = URL(string: urlText) {
                
                var request = URLRequest(url: url)
                request.timeoutInterval = timeInterval
                
                let sessionConfiguration = URLSessionConfiguration.default
             
                let publisher = URLSession(configuration: sessionConfiguration).dataTaskPublisher(for: request)
                publisher.sink { completion in
                    print("complete")
                    
                } receiveValue: { (data: Data, response: URLResponse) in
                    
                    do {
                        let dataModels = try JSONDecoder().decode(NewsModel.self, from: data)
                        promise(.success(dataModels))
                    }
                    catch {
                        print("Error while parsing: \(error)")
                        promise(.failure("Failure" as! Error))
                    }
                } .store(in: &strongSelf.cancellables)

            } else {
                promise(.failure("Failure" as! Error))
            }
            
        }
        
        
    }
    
    
}
