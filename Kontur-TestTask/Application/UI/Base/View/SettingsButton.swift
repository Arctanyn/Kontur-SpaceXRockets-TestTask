//
//  SettingsButton.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 07.02.2023.
//

import UIKit

final class SettingsButton: UIButton {
    
    //MARK: - Views
    
    private let settingsImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "gearshape"))
        imageView.tintColor = .label
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(settingsImageView, useAutoLayout: true)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private methods

private extension SettingsButton {
    func setConstraints() {
        NSLayoutConstraint.activate([
            settingsImageView.widthAnchor.constraint(equalToConstant: 35),
            settingsImageView.heightAnchor.constraint(equalTo: settingsImageView.widthAnchor),
            settingsImageView.topAnchor.constraint(equalTo: topAnchor),
            settingsImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            settingsImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            settingsImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
