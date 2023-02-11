//
//  SettingTableViewCell.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 11.02.2023.
//

import UIKit

final class SettingTableViewCell: BaseTableViewCell {
    
    //MARK: Properties
    
    private var settingOption: SettingsOptions!
    var didChangeUnit: ((_ settingOption: SettingsOptions, _ segmentedControlIndex: Int) -> Void)?
    
    //MARK: - Views
    
    private let settingNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var unitSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.selectedSegmentTintColor = .white
        segmentedControl.backgroundColor = .darkText
        
        segmentedControl.setTitleTextAttributes([
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 18, weight: .semibold)
        ], for: .selected)
        
        segmentedControl.setTitleTextAttributes([
            .foregroundColor: UIColor.tertiaryLabel,
            .font: UIFont.systemFont(ofSize: 18, weight: .semibold)
        ], for: .normal)
        
        segmentedControl.addTarget(self, action: #selector(segmentedControlDidChage), for: .valueChanged)
        
        return segmentedControl
    }()
    
    //MARK: - Methods
    
    override func prepareForReuse() {
        super.prepareForReuse()
        unitSegmentedControl.removeAllSegments()
    }
    
    func configure(with option: SettingsOptions, selectedIndex: Int) {
        settingNameLabel.text = option.name
        self.settingOption = option
        
        configureSegmentedControl(with: option, selectedIndex: selectedIndex)
    }
    
    //MARK: - Overrided Methods
    
    override func configureAppearance() {
        backgroundColor = .black
    }
    
    override func setupSubviews() {
        contentView.addSubview(settingNameLabel, useAutoLayout: true)
        contentView.addSubview(unitSegmentedControl, useAutoLayout: true)
    }
    
    override func makeSubviewsLayout() {
        NSLayoutConstraint.activate([
            settingNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            settingNameLabel.centerYAnchor.constraint(equalTo: unitSegmentedControl.centerYAnchor),
            
            unitSegmentedControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            unitSegmentedControl.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            unitSegmentedControl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            unitSegmentedControl.leadingAnchor.constraint(greaterThanOrEqualTo: settingNameLabel.trailingAnchor, constant: 20),
            unitSegmentedControl.widthAnchor.constraint(equalToConstant: 110),
            unitSegmentedControl.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}

//MARK: - Actions

@objc private extension SettingTableViewCell {
    func segmentedControlDidChage(_ sender: UISegmentedControl) {
        didChangeUnit?(settingOption, sender.selectedSegmentIndex)
    }
}

//MARK: - Private methods

private extension SettingTableViewCell {
    func configureSegmentedControl(with settingOption: SettingsOptions, selectedIndex: Int) {
        settingOption.units.enumerated().forEach { index, unit in
            unitSegmentedControl.insertSegment(withTitle: unit.designation, at: index, animated: false)
        }
        unitSegmentedControl.selectedSegmentIndex = selectedIndex
    }
}
