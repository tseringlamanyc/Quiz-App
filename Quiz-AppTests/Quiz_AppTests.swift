//
//  Quiz_AppTests.swift
//  Quiz-AppTests
//
//  Created by Tsering Lama on 5/7/21.
//

import XCTest
import Combine
@testable import Quiz_App

class Quiz_AppTests: XCTestCase {
    
    func testForApiClient() {
        // arrange
        let expectedQuestionCount = 30
        
        // act
        let apiClient = APIClient()
        var cancellables = Set<AnyCancellable>()
        apiClient.getAllQuestions().sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                XCTFail(error.localizedDescription)
            case .finished:
                print("finished")
            }
        }, receiveValue: { allQuestions in
            XCTAssertEqual(allQuestions.count, expectedQuestionCount)
        })
        .store(in: &cancellables)
    }
    
}
