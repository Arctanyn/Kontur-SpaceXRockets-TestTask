//
//  BaseViewController.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 06.02.2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    //MARK: - View Controller Lyfecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        setupSubviews()
        makeSubviewsLayout()
    }
}

//MARK: - ViewControllerUISetupProtocol

@objc extension BaseViewController: ViewControllerUISetupProtocol {
    func configureAppearance() {
        view.backgroundColor = .systemBackground
    }
    
    func setupSubviews() { }
    
    func makeSubviewsLayout() { }
}
