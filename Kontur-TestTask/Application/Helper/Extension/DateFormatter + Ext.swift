//
//  DateFormatter + Ext.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 10.02.2023.
//

import Foundation

extension DateFormatter {
    static func createLocaledFormatter(dateFormat: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = dateFormat
        return formatter
    }
}
