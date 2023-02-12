//
//  LaunchCollectionViewCell.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 11.02.2023.
//

import UIKit

final class LaunchCollectionViewCell: BaseCollectionViewCell {
    
    //MARK: - Views
    
    private lazy var labelsVStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, dateLabel])
        stackView.axis = .vertical
        stackView.alignment = .top
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let successIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //MARK: - Methods
    
    func configure(with viewModel: LaunchCellViewModel) {
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        successIcon.image = viewModel.success ? UIImage(named: "rocket_success") : UIImage(named: "rocket_fail")
    }
    
    //MARK: - Overrided Methods
    
    override func layoutSubviews() {
        layer.cornerRadius = frame.height * 0.25
        layer.cornerCurve = .continuous
        layer.masksToBounds = true
    }
    
    override func configureAppearance() {
        contentView.backgroundColor = .tertiarySystemFill
    }
    
    override func setupSubviews() {
        contentView.addSubview(labelsVStack, useAutoLayout: true)
        contentView.addSubview(successIcon, useAutoLayout: true)
    }
    
    override func makeSubviewsLayout() {
        NSLayoutConstraint.activate([
            successIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            successIcon.widthAnchor.constraint(equalToConstant: 30),
            successIcon.heightAnchor.constraint(equalTo: successIcon.widthAnchor),
            successIcon.centerYAnchor.constraint(equalTo: labelsVStack.centerYAnchor),
            
            labelsVStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            labelsVStack.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 20),
            labelsVStack.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20),
            labelsVStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelsVStack.trailingAnchor.constraint(lessThanOrEqualTo: successIcon.leadingAnchor, constant: -20)
        ])
    }
}
