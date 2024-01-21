//
//  DetailNewsViewController.swift
//  NewsAPP
//
//  Created by mohammed on 21/01/2024.
//

import UIKit
import Kingfisher
import SafariServices


class DetailNewsViewController: UIViewController {    
    //*********************************************************************
    // MARK: - Iboutlet
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsLink: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    
    //*********************************************************************
    // MARK: - Properties
    var viewModel: DetailViewModel
    
    //*********************************************************************
    // MARK: - Init
    init(
        viewModel: DetailViewModel
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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(linkTapped))
        newsLink.isUserInteractionEnabled = true
        newsLink.addGestureRecognizer(tapGesture)
        configureView()
    }
    
    //*********************************************************************
    // MARK: - Fonctions
    @objc func linkTapped() {
        viewModel.navigateToLink()
        }
    
    func configureView() {
        self.newsImage.loadImage(from: viewModel.getImageUrl())
        self.newsTitle.text = viewModel.getTitle()
        self.newsLink.text = viewModel.getNewsLink()
        self.newsDescription.text = viewModel.getDescription()
    }
}
