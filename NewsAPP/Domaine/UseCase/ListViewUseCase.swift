//
//  ListViewUseCase.swift
//  NewsAPP
//
//  Created by mohammed on 21/01/2024.
//

import Foundation
import Combine

protocol ListViewUseCaseProtocol {
    func execute()  -> AnyPublisher<Posts, Error>
}

class ListViewUseCase: ListViewUseCaseProtocol {
    //*********************************************************************
    // MARK: - Properties
    var repository: HomeRepositoryProtocol
    
    //*********************************************************************
    // MARK: - Init
    init( repository: HomeRepositoryProtocol = ListNewsRepository()) {
        self.repository = repository
    }
    
    //*********************************************************************
    // MARK: - Functions
    func execute()  -> AnyPublisher<Posts, Error> {
        repository.fetchData()
            .map({$0.posts})
            .eraseToAnyPublisher()
    }
}
