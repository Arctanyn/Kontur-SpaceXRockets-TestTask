//
//  PresentableView.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 06.02.2023.
//

import UIKit

protocol PresentableView: AnyObject where Self: UIViewController {
    associatedtype Presenter

    var presenter: Presenter! { get set }
}
