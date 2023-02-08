//
//  BaseCollectionViewCell.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 07.02.2023.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
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

//MARK: - CollectionViewCellUISetupProtocol

@objc extension BaseCollectionViewCell: CollectionViewCellUISetupProtocol {
    func configureAppearance() { }
    
    func setupSubviews() { }
    
    func makeSubviewsLayout() { }
}
