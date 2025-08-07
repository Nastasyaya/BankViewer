//
//  DateConverter.swift
//  BankViewer
//
//  Created by Анастасия Кутняхова on 07.08.2025.
//

import Foundation

protocol DateConverter {
    func convert(from dateString: String) -> Date?
}

struct DateConverterImp: DateConverter {
    func convert(from dateString: String) -> Date? {
        let formatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            formatter.locale = Locale(identifier: "en_US_POSIX")
            return formatter
        }()
        
        return formatter.date(from: dateString)
    }
}
