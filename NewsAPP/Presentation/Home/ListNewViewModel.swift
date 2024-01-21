//
//  ListNewViewModel.swift
//  NewsAPP
//
//  Created by mohammed on 21/01/2024.
//

import Foundation
import Combine

class ListViewViewModel {
    //*********************************************************************
    // MARK: - Enum
    enum State {
        case initial
        case loading
        case success(Posts)
        case fail(Error)
    }
    
    //*********************************************************************
    // MARK: - Properties
    let useCase: ListViewUseCaseProtocol
    weak var coordinator: HomeCoordinator?
    var subscriptions = Set<AnyCancellable>()
    @Published private(set) 
    var state = State.initial
    
    //*********************************************************************
    // MARK: - Init
    init(useCase: ListViewUseCaseProtocol,  coordinator: HomeCoordinator?) {
        self.useCase = useCase
        self.coordinator = coordinator
    }
    
    //*********************************************************************
    // MARK: - Fonctions
    func fetchData() {
        useCase.execute()
        .receive(on: DispatchQueue.main)
        .sink { [weak self] completion in
            guard let `self` = self else { return }
            switch completion {
            case .failure(let error):
                self.state = .fail(error)
            case .finished:
                print("nothing much to do here")
            }
        } receiveValue: { [weak self ](response) in
            guard let `self` = self else { return }
            debugPrint(response)
            self.state = .success(response)
        }
        .store(in: &subscriptions)
    }
    
    func didTapItem(item: Post) {
        coordinator?.showDetails(for: item)
    }
}
