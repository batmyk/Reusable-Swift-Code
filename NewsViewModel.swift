//
//  NewsViewModel.swift
//  CombineBasics
//
//  Created by Mayank on 21/03/23.
//

import Foundation
import Combine

class NewsViewModel {
    
    var apiCall = APICall()
    private var cancellableSet: Set<AnyCancellable> = []
    
    
    func fetchDataFromService(completion: @escaping((NewsModel) -> Void)) {
        
        apiCall.fetchNews(urlText: "https://newsapi.org/v2/everything?q=tesla&from=2023-03-21&sortBy=publishedAt&apiKey=c0ec0d866444432397d05994eaabcf0b", timeInterval: 5.0)
            .sink { completion in
                
                switch completion {
                case .failure(let error):
                    print("Error : \(error)")
                case .finished:
                    print("Complete")
                }
            } receiveValue: { dataSet in
                
                completion(dataSet)
                
            }
            .store(in: &cancellableSet)

        
        
    }
    
}
