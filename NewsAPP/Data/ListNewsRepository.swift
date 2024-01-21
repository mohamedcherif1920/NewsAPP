//
//  ListNewsRepository.swift
//  NewsAPP
//
//  Created by mohammed on 21/01/2024.
//

import Foundation
import Combine

protocol HomeRepositoryProtocol {
    func fetchData()  ->  AnyPublisher<NewsData, Error>
}

class ListNewsRepository: HomeRepositoryProtocol {
    //*********************************************************************
    // MARK: - Properties
    let service: ServiceProtocol
    
    //*********************************************************************
    // MARK: - Init
    init(service: ServiceProtocol = Service()) {
        self.service = service
    }
    
    //*********************************************************************
    // MARK: - Functions
    func fetchData() -> AnyPublisher<NewsData, Error> {
        return service.fetchData()
            .map({$0.articles})
            .map(NewsData.init)
            .eraseToAnyPublisher()
    }
}


