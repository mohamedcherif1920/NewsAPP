//
//  EndPoints.swift
//  NewsAPP
//
//  Created by mohammed on 21/01/2024.
//

import Foundation

enum BaseUrls {
    static let usine = EndPoints.getFullUrl()
}

enum EndPoints {
    case domain
    case querry
    case apiKey
    
    var value: String {
        switch self {
        case .domain:
            return Bundle.main.ParseConfiguration(attribute: "BaseUrl")
        case .querry:
            return "?q=".appending(Bundle.main.ParseConfiguration(attribute: "Query"))
        case .apiKey:
            return "&apiKey=".appending(Bundle.main.ParseConfiguration(attribute: "ApiKey"))
        }
    }
}

extension EndPoints {
    static func getFullUrl() -> String{
        return EndPoints.domain.value.appending(EndPoints.querry.value).appending(EndPoints.apiKey.value)
    }
}

extension Bundle {
    func ParseConfiguration(attribute: String) -> String {
        guard let result = Bundle.main.object(forInfoDictionaryKey: attribute) as? String else {
            fatalError("url must not be empty in plist")
        }
        return result
    }
}
