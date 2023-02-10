//
//  Date + Ext.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 10.02.2023.
//

import Foundation

extension Date {
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter.createLocaledFormatter(dateFormat: format)
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
