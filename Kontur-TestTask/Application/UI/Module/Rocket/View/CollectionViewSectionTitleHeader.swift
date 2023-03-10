//
//  CollectionViewSectionTitleHeader.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 07.02.2023.
//

import UIKit

final class CollectionViewSectionTitleHeader: UICollectionReusableView {
    
    static let identifier = String(describing: CollectionViewSectionTitleHeader.self)
    
    //MARK: - Views
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
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
    
    //MARK: - Methods
    
    func setTitle(_ title: String?) {
        titleLabel.text = title?.uppercased()
    }
}

//MARK: - ViewUISetupProtocol

extension CollectionViewSectionTitleHeader: ViewUISetupProtocol {
    func configureAppearance() { }
    
    func setupSubviews() {
        addSubview(titleLabel, useAutoLayout: true)
    }
    
    func makeSubviewsLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
