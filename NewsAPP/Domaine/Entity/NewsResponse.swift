//
//  NewsResponse.swift
//  NewsAPP
//
//  Created by mohammed on 21/01/2024.
//

import Foundation
// MARK: - Typealias
typealias Posts = [Post]

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: String
    let title, description: String
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}

struct NewsData {
    let posts: Posts
    init(articles: [Article]) {
        self.posts = articles.map(Post.init)
    }
}
// MARK: - Post
struct Post {
    let source: Source
    let author: String
    let title, description: String
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String
    init(atricle: Article) {
        self.source = atricle.source
        self.author = atricle.author
        self.title = atricle.title
        self.description = atricle.description
        self.url = atricle.url
        self.urlToImage = atricle.urlToImage
        self.publishedAt = atricle.publishedAt
        self.content = atricle.content
    }
}
