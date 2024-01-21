//
//  MokedListViewUseCase.swift
//  NewsAPP
//
//  Created by mohammed on 21/01/2024.
//

import Foundation
import UIKit
import Combine


class MokedListViewUseCase : ListViewUseCaseProtocol {
    
    //*********************************************************************
    // MARK: - Properties
    var executeIsCalled = false
    
    //*********************************************************************
    // MARK: - Functions
    func execute() -> AnyPublisher<Posts, Error> {
        self.executeIsCalled = true
        let mockedData = MockedData.getMockedData()
            return Just(mockedData)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
    }
}

