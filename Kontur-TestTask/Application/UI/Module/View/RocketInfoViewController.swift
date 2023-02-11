//
//  RocketInfoViewController.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 05.02.2023.
//

import UIKit

final class RocketInfoViewController: BaseViewController, PresentableView {

    typealias Presenter = RocketPresenter
    
    //MARK: Properties
    
    var presenter: Presenter! {
        didSet {
            rocketInfoCollectionView.reloadData()
            view.layoutIfNeeded()
        }
    }
        
    //MARK: - Views

    private var supplementaryStageHeaderItem: NSCollectionLayoutBoundarySupplementaryItem {
        .init(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(50)
            ),
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
    }
    
    private lazy var rocketInfoCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
 
        collectionView.register(
            CollectionViewHeaderReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: CollectionViewHeaderReusableView.identifier
        )
        
        collectionView.register(RocketHeaderCollectionViewCell.self, forCellWithReuseIdentifier: RocketHeaderCollectionViewCell.identifier)

        collectionView.register(
            RocketSpecificationCollectionViewCell.self,
            forCellWithReuseIdentifier: RocketSpecificationCollectionViewCell.identifier
        )
        collectionView.register(
            RocketInfoCollectionViewCell.self,
            forCellWithReuseIdentifier: RocketInfoCollectionViewCell.identifier
        )
        collectionView.register(
            RocketStageCollectionViewCell.self,
            forCellWithReuseIdentifier: RocketStageCollectionViewCell.identifier
        )
        collectionView.register(
            LaunchesButtonCollectionViewCell.self,
            forCellWithReuseIdentifier: LaunchesButtonCollectionViewCell.identifier
        )
        
        return collectionView
    }()
    
    //MARK: - Overrided Methods
    
    override func setupSubviews() {
        
        view.addSubview(rocketInfoCollectionView, useAutoLayout: true)
        rocketInfoCollectionView.dataSource = self
        
        
    }
    
    override func makeSubviewsLayout() {
        NSLayoutConstraint.activate([
            rocketInfoCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: -deviceNavigationStatusBarSafeAreaIndent),
            rocketInfoCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            rocketInfoCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            rocketInfoCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

//MARK: - Actions

@objc private extension RocketInfoViewController {
    func showLaunches() {

    }
}

//MARK: - Private methods

private extension RocketInfoViewController {
    func makeCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] section, layoutEnvironment in
            guard
                let self,
                let rocketInfoSection = self.presenter.sectionTypeForSection(at: section)
            else { return nil }
            
            switch rocketInfoSection {
            case .rocketImage:
                return self.createRocketHeaderSection()
            case .specifications:
                return self.createRocketSpecificationsSection()
            case .general, .firstStage, .secondStage:
                return self.createRocketInfoSection(for: rocketInfoSection)
            case .button:
                return self.createLaunchesButtonSection()
            }
        }
    }
    
    func createRocketHeaderSection() -> NSCollectionLayoutSection {
        let item = CompositionalLayoutHelper.createItem(
            widthDimension: .fractionalWidth(1),
            heightDimention: .fractionalHeight(1)
        )
        
        let group = CompositionalLayoutHelper.createGroup(
            alignment: .horizontal,
            widthDimension: .fractionalWidth(1),
            heightDimention: .fractionalHeight(0.45),
            subitems: [item]
        )
        
        return CompositionalLayoutHelper.createSection(group: group)
    }
    
    func createRocketSpecificationsSection() -> NSCollectionLayoutSection {
        let item = CompositionalLayoutHelper.createItem(
            widthDimension: .fractionalWidth(1),
            heightDimention: .fractionalHeight(1)
        )
        
        let group = CompositionalLayoutHelper.createGroup(
            alignment: .horizontal,
            widthDimension: .fractionalWidth(0.27),
            heightDimention: .fractionalWidth(0.27),
            subitems: [item]
        )
        
        return CompositionalLayoutHelper.createSection(
            group: group,
            scrollingBehavior: .continuous,
            interGroupSpacing: 10,
            contentInsets: .init(top: 30, leading: 30, bottom: 20, trailing: 30)
        )
    }
    
    func createRocketInfoSection(for rocketSection: RocketInfoSection) -> NSCollectionLayoutSection {
        let item = CompositionalLayoutHelper.createItem(
            widthDimension: .fractionalWidth(1),
            heightDimention: .fractionalHeight(1)
        )
        
        let group = CompositionalLayoutHelper.createGroup(
            alignment: .vertical,
            widthDimension: .fractionalWidth(1),
            heightDimention: .estimated(40),
            subitems: [item]
        )
        
        let section = CompositionalLayoutHelper.createSection(
            group: group,
            interGroupSpacing: 10,
            contentInsets: .init(top: 20, leading: 30, bottom: 30, trailing: 30)
        )

        if rocketSection == .firstStage || rocketSection == .secondStage {
            section.boundarySupplementaryItems = [self.supplementaryStageHeaderItem]
        }
        
        return section
    }
    
    func createLaunchesButtonSection() -> NSCollectionLayoutSection {
        let item = CompositionalLayoutHelper.createItem(
            widthDimension: .fractionalWidth(1),
            heightDimention: .fractionalHeight(1)
        )
        
        let group = CompositionalLayoutHelper.createGroup(
            alignment: .vertical,
            widthDimension: .fractionalWidth(1),
            heightDimention: .estimated(70),
            subitems: [item]
        )
        
        return CompositionalLayoutHelper.createSection(
            group: group,
            contentInsets: .init(top: 0, leading: 30, bottom: 0, trailing: 30)
        )
    }
}

//MARK: - RocketViewControllerProtocol

extension RocketInfoViewController: RocketViewControllerProtocol {
    func reloadData() {

    }
}

//MARK: - UIColletionViewDataSource

extension RocketInfoViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        guard let presenter else { return 0 }
        return presenter.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let presenter else { return 1 }
        return presenter.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let rocketInfoSection = presenter.sectionTypeForSection(at: indexPath.section) else {
            fatalError()
        }
        
        switch rocketInfoSection {
        case .rocketImage:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RocketHeaderCollectionViewCell.identifier,
                for: indexPath
            ) as! RocketHeaderCollectionViewCell
            cell.configure(with: presenter.viewModelForRocketHeader())
            return cell
        case .specifications:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RocketSpecificationCollectionViewCell.identifier,
                for: indexPath
            ) as! RocketSpecificationCollectionViewCell
            
            if let cellViewModel = presenter.viewModelForSpecificationCell(at: indexPath) {
                cell.configure(with: cellViewModel)
            }
            
            return cell
        case .general:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RocketInfoCollectionViewCell.identifier,
                for: indexPath
            ) as! RocketInfoCollectionViewCell
            
            if let cellViewModel = presenter.viewModelForGeneralInfoCell(at: indexPath) {
                cell.configure(with: cellViewModel)
            }
            
            return cell
        case .firstStage, .secondStage:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RocketStageCollectionViewCell.identifier,
                for: indexPath
            ) as! RocketStageCollectionViewCell
            
            if let cellViewModel = presenter.viewModelForStageInfoCell(at: indexPath) {
                cell.configure(with: cellViewModel)
            }
            
            return cell
            
        case .button:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchesButtonCollectionViewCell.identifier, for: indexPath) as! LaunchesButtonCollectionViewCell
            cell.addTargetToButton(target: self, action: #selector(showLaunches), forEvent: .touchUpInside)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let rocketInfoSection = presenter.sectionTypeForSection(at: indexPath.section) else {
            return UICollectionReusableView()
        }
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: CollectionViewHeaderReusableView.identifier,
                for: indexPath
            ) as! CollectionViewHeaderReusableView
            view.setTitle(rocketInfoSection.title)
            return view
        default:
            return UICollectionReusableView()
        }
    }
}
