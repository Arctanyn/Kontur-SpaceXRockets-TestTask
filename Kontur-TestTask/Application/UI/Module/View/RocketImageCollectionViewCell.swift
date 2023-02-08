//
//  RocketImageCollectionViewCell.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 07.02.2023.
//

import UIKit

final class RocketImageCollectionViewCell: BaseCollectionViewCell {
    
    //MARK: - Views
    
    private let rocketNameView = RocketNameView()
    
    private let rocketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //MARK: - Methods
    
    func configure(with viewModel: RocketImageCellViewModel) {
        rocketImageView.image = viewModel.image
    }
    
    //MARK: - Overrided Methods
    
    override func setupSubviews() {
        addSubview(rocketImageView, useAutoLayout: true)
        addSubview(rocketNameView, useAutoLayout: true)
    }
    
    override func makeSubviewsLayout() {
        NSLayoutConstraint.activate([
            rocketImageView.topAnchor.constraint(equalTo: topAnchor),
            rocketImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            rocketNameView.trailingAnchor.constraint(equalTo: trailingAnchor),
            rocketImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            rocketNameView.bottomAnchor.constraint(equalTo: bottomAnchor),
            rocketNameView.leadingAnchor.constraint(equalTo: leadingAnchor),
            rocketNameView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
