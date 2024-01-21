//
//  HomeFactory.swift
//  NewsAPP
//
//  Created by mohammed on 21/01/2024.
//

import UIKit

final class HomeFactory {

    func makeViewController(coordinator: HomeCoordinator) -> UIViewController {
        let useCase = ListViewUseCase()
        let viewModel = ListViewViewModel(useCase: useCase, coordinator: coordinator)
        return ListNewsViewController(viewModel: viewModel)
    }
}
