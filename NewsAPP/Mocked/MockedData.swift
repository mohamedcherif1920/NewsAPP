//
//  MockedData.swift
//  NewsAPP
//
//  Created by mohammed on 21/01/2024.
//

import Foundation
import UIKit

class MockedData {
     static func getMockedData() -> [Post] {
         return [Post(atricle:
                        Article(source: Source(id: "source", name: "1"), author: "med", title: "med", description: "med", url: "med", urlToImage: "med", publishedAt: "med", content: "med")
                     )]
    }
}
