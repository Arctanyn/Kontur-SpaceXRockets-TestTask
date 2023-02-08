//
//  RocketImageCollectionViewCell.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 07.02.2023.
//

import UIKit

final class RocketImageCollectionViewCell: BaseCollectionViewCell {
    
    //MARK: - Views
    
    private let rocketHeaderView = RockeHeaderView()
    
    private let rocketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    //MARK: - Methods
    
    func configure(with viewModel: RocketImageCellViewModel) {
        rocketImageView.image = viewModel.image
    }
    
    //MARK: - Overrided Methods
    
    override func setupSubviews() {
        addSubview(rocketImageView, useAutoLayout: true)
        addSubview(rocketHeaderView, useAutoLayout: true)
    }
    
    override func makeSubviewsLayout() {
        NSLayoutConstraint.activate([
            rocketImageView.topAnchor.constraint(equalTo: topAnchor),
            rocketImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            rocketImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            rocketImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            rocketHeaderView.bottomAnchor.constraint(equalTo: bottomAnchor),
            rocketHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            rocketHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
