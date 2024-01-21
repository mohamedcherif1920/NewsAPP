//
//  HomeCoordinator.swift
//  NewsAPP
//
//  Created by mohammed on 21/01/2024.
//

import Foundation
import UIKit
import SafariServices

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    func start()
}

class HomeCoordinator: Coordinator {
    //*********************************************************************
    // MARK: - Properties
    var navigationController: UINavigationController
    
    //*********************************************************************
    // MARK: - Init
    init(window: UIWindow, navigationController: UINavigationController) {
        self.navigationController = navigationController
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    //*********************************************************************
    // MARK: - Function
    func start() {
        let homeViewController = HomeFactory().makeViewController(coordinator: self)
        navigationController.pushViewController(homeViewController, animated: false)
    }
    
    func showDetails(for post: Post) {
        let viewModel = DetailViewModel(item: post) { [weak self] url in
            self?.showSafariView(for: url)
        }
        let detailsViewController = DetailNewsViewController(viewModel: viewModel)
        navigationController.pushViewController(detailsViewController, animated: true)
    }
    
    func showSafariView(for url: String) {
        guard let url = URL(string: url) else { return }
        let safariViewController = SFSafariViewController(url: url)
        navigationController.present(safariViewController, animated: true, completion: nil)
    }
}

