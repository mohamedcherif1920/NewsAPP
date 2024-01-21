//
//  Service.swift
//  NewsAPP
//
//  Created by mohammed on 21/01/2024.
//

import Foundation
import Combine

protocol ServiceProtocol: AnyObject {
    func fetchData() -> AnyPublisher<NewsResponse, Error>
}

enum FetchError: Error {
    case failed
}

class Service: ServiceProtocol {
    
    func fetchData() -> AnyPublisher<NewsResponse, Error> {
        guard let url = URL(string: BaseUrls.usine) else {
            return Future<NewsResponse, Error>(){ promise in
                promise(.failure(FetchError.failed))
            }.eraseToAnyPublisher()
        }
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: NewsResponse.self,
                    decoder: JSONDecoder())
            .catch { error in
                Future<NewsResponse, Error>(){ promise in
                    promise(.failure(error))
                }
            }.eraseToAnyPublisher()
        return publisher
    }
}
