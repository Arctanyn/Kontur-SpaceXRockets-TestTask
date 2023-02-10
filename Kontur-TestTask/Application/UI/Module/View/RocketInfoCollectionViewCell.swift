//
//  RocketInfoCollectionViewCell.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 07.02.2023.
//

import UIKit

class RocketInfoCollectionViewCell: BaseCollectionViewCell {
    
    //MARK: Views
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .right
        return label
    }()
    
    //MARK: - Methods
    
    func configure(with viewModel: RocketInfoCellViewModel) {
        titleLabel.text = viewModel.title
        infoLabel.text = viewModel.info
    }
    
    //MARK: - Overrided Methods
    
    override func configureAppearance() {
        backgroundColor = .systemBackground
    }
    
    override func setupSubviews() {
        contentView.addSubview(titleLabel, useAutoLayout: true)
        contentView.addSubview(infoLabel, useAutoLayout: true)
    }
    
    override func makeSubviewsLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            infoLabel.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 10)
        ])
    }
}
