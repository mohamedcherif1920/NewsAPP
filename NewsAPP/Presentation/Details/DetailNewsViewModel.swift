//
//  DetailNewsViewModel.swift
//  NewsAPP
//
//  Created by mohammed on 21/01/2024.
//

import UIKit

class DetailViewModel {
    //*********************************************************************
    // MARK: - Properties
    var didTapSafariView: (String)->()
    var item: Post
    
    //*********************************************************************
    // MARK: - Init
    init( item: Post, didTapSafariView: @escaping (String)->()) {
        self.item = item
        self.didTapSafariView = didTapSafariView
    }
    
    //*********************************************************************
    // MARK: - Functions
    func getTitle() -> String {
        return item.title
    }
    
    func getDescription() -> String {
        return item.description
    }
    
    func getNewsLink() -> String {
        return item.url
    }
    
    func getImageUrl() -> String? {
        return item.urlToImage
    }
    
    func navigateToLink() {
        didTapSafariView(item.url)
    }
}
