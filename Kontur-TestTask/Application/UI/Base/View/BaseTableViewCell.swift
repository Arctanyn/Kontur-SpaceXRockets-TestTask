//
//  BaseTableViewCell.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 11.02.2023.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    //MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureAppearance()
        setupSubviews()
        makeSubviewsLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension BaseTableViewCell: TableViewCellUISetupProtocol {
    func configureAppearance() { }
    
    func setupSubviews() { }
    
    func makeSubviewsLayout() { }
    
    
}
