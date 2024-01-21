//
//  DateExtension.swift
//  NewsAPP
//
//  Created by mohammed on 18/01/2024.
//

import UIKit

extension Date {
    static func convertDateString(_ dateString: String, fromFormat: String, toFormat: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = fromFormat

        guard let date = dateFormatter.date(from: dateString) else {
            return nil
        }

        dateFormatter.dateFormat = toFormat
        return dateFormatter.string(from: date)
    }
}
