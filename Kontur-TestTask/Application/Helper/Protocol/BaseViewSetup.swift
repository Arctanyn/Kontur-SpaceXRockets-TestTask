//
//  BaseViewSetup.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 06.02.2023.
//

import UIKit

protocol BaseViewSetup: AnyObject {
    func configureAppearance()
    func setupSubviews()
    func makeSubviewsLayout()
}

protocol ViewControllerUISetupProtocol: BaseViewSetup where Self: UIViewController { }
protocol ViewUISetupProtocol: BaseViewSetup where Self: UIView { }
protocol CollectionViewCellUISetupProtocol: BaseViewSetup where Self: UICollectionViewCell { }
