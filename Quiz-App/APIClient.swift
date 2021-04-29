//
//  APIClient.swift
//  Quiz-App
//
//  Created by Tsering Lama on 4/29/21.
//

import Foundation
import Combine

class APIClient {
    
    public func getAllQuestions() -> AnyPublisher<[Question], Error> {
        let endpoint = "https://607dde30184368001769e8ab.mockapi.io/quizapi/v1/quiz"
        let url = URL(string: endpoint)!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Question].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
