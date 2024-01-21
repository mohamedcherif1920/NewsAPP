//
//  ListNewsViewController.swift
//  NewsAPP
//
//  Created by mohammed on 21/01/2024.
//

import UIKit
import Foundation
import Combine

class ListNewsViewController: UIViewController {
    //*********************************************************************
    // MARK: - Iboutlet
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    //*********************************************************************
    // MARK: - Properties
    private let viewModel: ListViewViewModel
    private var subscriptions = Set<AnyCancellable>()
    
    //*********************************************************************
    // MARK: - Init
    init(
        viewModel: ListViewViewModel
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //*********************************************************************
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        setupBindings()
        
    }
    
    //*********************************************************************
    // MARK: - Fonctions
    private func setupBindings() {
        self.viewModel.$state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                self?.render(state)
            }
            .store(in: &subscriptions)
        self.viewModel.fetchData()
    }
    
    private func render(_ state: ListViewViewModel.State) {
        switch state {
        case .loading, .initial:
            updateActivityIndicator(isHidden: false)
            
        case .fail:
            updateActivityIndicator(isHidden: true)
            self.view.backgroundColor = .red
            
        case .success:
            updateActivityIndicator(isHidden: true)
            tableView.reloadData()
            
        }
    }
    
    private func updateActivityIndicator(isHidden: Bool) {
        if isHidden {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        } else {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
        }
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: CellIdentifiers.cellIdLarge,bundle: nil),
                                forCellReuseIdentifier: CellIdentifiers.tableViewCellId)
        
        tableView.estimatedRowHeight = 60.0
        tableView.rowHeight = UITableView.automaticDimension
    }
}

//*********************************************************************
// MARK: - TableViewExtension
extension ListNewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard case .success(let articles) = viewModel.state else {
            return 0
        }
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard case .success(let articles) = viewModel.state,  let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.tableViewCellId, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(item: articles[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard case .success(let articles) = viewModel.state else {
            return
        }
        viewModel.didTapItem(item: articles[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
