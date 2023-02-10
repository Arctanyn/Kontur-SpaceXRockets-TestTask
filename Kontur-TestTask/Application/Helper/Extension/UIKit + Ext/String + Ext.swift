//
//  String + Ext.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 10.02.2023.
//

import Foundation

extension String {
    func convertToDate(format: String) -> Date? {
        let dateFormatter = DateFormatter.createLocaledFormatter(dateFormat: format)
        return dateFormatter.date(from: self)
    }
}
