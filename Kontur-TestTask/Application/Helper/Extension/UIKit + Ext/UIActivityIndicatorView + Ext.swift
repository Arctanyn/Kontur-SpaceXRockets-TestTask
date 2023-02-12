//
//  UIActivityIndicatorView + Ext.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 12.02.2023.
//

import UIKit

extension UIActivityIndicatorView {
    static let loadingIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.frame = CGRect(origin: .zero, size: .zero)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
}
