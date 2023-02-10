//
//  RocketStageCollectionViewCell.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 07.02.2023.
//

import UIKit

final class RocketStageCollectionViewCell: BaseCollectionViewCell {
    
    //MARK: Views
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let specificationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .right
        return label
    }()
    
    private let unitLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .secondaryLabel
        label.textAlignment = .right
        return label
    }()
    
    //MARK: - Methods
    
    func configure(with viewModel: RocketStageCellViewModel) {
        titleLabel.text = viewModel.title
        specificationLabel.text = viewModel.specification
        
        unitLabel.text = viewModel.unit
        unitLabel.isHidden = viewModel.unit == nil
    }
    
    //MARK: - Overrided Methods
    
    override func configureAppearance() {
        backgroundColor = .systemBackground
    }
    
    override func setupSubviews() {
        contentView.addSubview(titleLabel, useAutoLayout: true)
        contentView.addSubview(specificationLabel, useAutoLayout: true)
        contentView.addSubview(unitLabel, useAutoLayout: true)
    }
    
    override func makeSubviewsLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            unitLabel.widthAnchor.constraint(equalToConstant: 30),
            unitLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            unitLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            unitLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            specificationLabel.trailingAnchor.constraint(equalTo: unitLabel.leadingAnchor, constant: -10),
            specificationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            specificationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            specificationLabel.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 10)
        ])
    }
}
