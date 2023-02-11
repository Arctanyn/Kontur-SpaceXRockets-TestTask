//
//  LaunchesButtonCollectionViewCell.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 11.02.2023.
//

import UIKit

final class LaunchesButtonCollectionViewCell: BaseCollectionViewCell {
    
    //MARK: - Views
    
    private lazy var showLaunchesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show launches", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .tertiarySystemFill
        button.titleLabel?.font = .systemFont(ofSize: 19, weight: .semibold)
        return button
    }()
    
    //MARK: - Methods
    
    func addTargetToButton(target: Any?, action: Selector, forEvent event: UIControl.Event) {
        showLaunchesButton.addTarget(target, action: action, for: event)
    }
    
    //MARK: - Overrided Methods
    
    override func layoutSubviews() {
        showLaunchesButton.layer.cornerRadius = 10
        showLaunchesButton.layer.cornerCurve = .continuous
    }
    
    override func setupSubviews() {
        contentView.addSubview(showLaunchesButton, useAutoLayout: true)
    }
    
    override func makeSubviewsLayout() {
        NSLayoutConstraint.activate([
            showLaunchesButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            showLaunchesButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            showLaunchesButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            showLaunchesButton.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
}
