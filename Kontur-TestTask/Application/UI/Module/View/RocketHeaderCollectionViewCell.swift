//
//  RocketImageCollectionViewCell.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 07.02.2023.
//

import UIKit

final class RocketHeaderCollectionViewCell: BaseCollectionViewCell {
    
    //MARK: Core Graphics
    
    private let shadowGradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.black.withAlphaComponent(0.8).cgColor,
            UIColor.clear.cgColor,
            UIColor.clear.cgColor,
        ]
        return gradient
    }()
    
    //MARK: - Views
    
    private let rocketHeaderView = RockeHeaderView()
    
    private lazy var rocketImageView: AsyncImageView = {
        let imageView = AsyncImageView(url: nil)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .tertiarySystemFill
        imageView.layer.insertSublayer(shadowGradient, at: 0)
        return imageView
    }()
    
    //MARK: - Methods
    
    func configure(with viewModel: RocketHeaderCellViewModel) {
        rocketHeaderView.rocketName = viewModel.rocketName
        
        Task {
            await rocketImageView.fetchImage(from: viewModel.imageURL)
        }
    }
    
    override func layoutSubviews() {
        shadowGradient.frame = rocketImageView.bounds
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
