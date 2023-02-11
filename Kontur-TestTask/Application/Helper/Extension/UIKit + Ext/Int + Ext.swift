//
//  Int + Ext.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 11.02.2023.
//

import Foundation

extension Int {
    func toCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
