//
//  RocketSpecificationCollectionViewCell.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 07.02.2023.
//

import UIKit

final class RocketSpecificationCollectionViewCell: BaseCollectionViewCell {
    
    //MARK: Views
    
    private lazy var vStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(specificationNameLabel)
        return stackView
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
//        label.text = "180"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let specificationNameLabel: UILabel = {
        let label = UILabel()
//        label.text = "Height, ft"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Methods
    
    func configure(with viewModel: RocketSpecificationCellViewModel) {
        valueLabel.text = viewModel.value
        specificationNameLabel.text = "\(viewModel.specificationName), \(viewModel.unit.name)"
    }
    
    //MARK: - Overrided Methods
    
    override func layoutSubviews() {
        layer.cornerCurve = .continuous
        layer.cornerRadius = frame.height * 0.3
    }
    
    override func configureAppearance() {
        backgroundColor = .tertiarySystemFill
    }
    
    override func setupSubviews() {
        contentView.addSubview(vStack, useAutoLayout: true)
    }
    
    override func makeSubviewsLayout() {
        NSLayoutConstraint.activate([
            vStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            vStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
