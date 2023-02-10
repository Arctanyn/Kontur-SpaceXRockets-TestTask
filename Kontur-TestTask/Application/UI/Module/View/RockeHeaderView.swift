//
//  RockeHeaderView.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 07.02.2023.
//

import UIKit

final class RockeHeaderView: BaseView {
    
    //MARK: Views
    
    var rocketName = String() {
        didSet {
            rocketNameLabel.text = rocketName
        }
    }
    
    private lazy var rocketNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .medium)
        label.text = rocketName
        return label
    }()
    
    private let settingsButton = SettingsButton()
    
    //MARK: - Methods
    
    func configure(with rocketName: String) {
        rocketNameLabel.text = rocketName
    }
    
    func addSettingsButtonAction(target: Any?, action: Selector, forEvent event: UIControl.Event) {
        settingsButton.addTarget(target, action: action, for: event)
    }
    
    //MARK: - Overrided Methods
    
    override func layoutSubviews() {
        layer.cornerRadius = frame.height / 2
        layer.cornerCurve = .continuous
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    override func configureAppearance() {
        backgroundColor = .systemBackground
    }
    
    override func setupSubviews() {
        addSubview(rocketNameLabel, useAutoLayout: true)
        addSubview(settingsButton, useAutoLayout: true)
    }
    
    override func makeSubviewsLayout() {
        NSLayoutConstraint.activate([
            rocketNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            rocketNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            rocketNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),

            settingsButton.centerYAnchor.constraint(equalTo: rocketNameLabel.centerYAnchor),
            settingsButton.leadingAnchor.constraint(greaterThanOrEqualTo: rocketNameLabel.trailingAnchor, constant: 20),
            settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }
}
