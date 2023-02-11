//
//  BaseView.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 07.02.2023.
//

import UIKit

class BaseView: UIView {
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
        setupSubviews()
        makeSubviewsLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - ViewUISetupProtocol

@objc extension BaseView: ViewUISetupProtocol {
    func configureAppearance() {
        backgroundColor = .black
    }
    
    func setupSubviews() { }
    
    func makeSubviewsLayout() { }
}
