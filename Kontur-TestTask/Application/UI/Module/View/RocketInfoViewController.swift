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
        
        collectionView.register(RocketImageCollectionViewCell.self, forCellWithReuseIdentifier: RocketImageCollectionViewCell.identifier)

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
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                )
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize:
                    .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(0.5)
                    ),
                    subitems: [item]
                )
                
                let section = NSCollectionLayoutSection(group: group)
                return section
            case .specifications:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                )
                
                let group = NSCollectionLayoutGroup.horizontal(
                    layoutSize:
                    .init(
                        widthDimension: .fractionalWidth(0.27),
                        heightDimension: .fractionalWidth(0.27)
                    ),
                    subitems: [item]
                )
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 30, leading: 30, bottom: 20, trailing: 30)
                
                return section
            case .general, .firstStage, .secondStage:
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                )
                
                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(40)
                    ),
                    subitems: [item]
                )
                                
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 20, leading: 30, bottom: 30, trailing: 30)
                
                if rocketInfoSection == .firstStage || rocketInfoSection == .secondStage {
                    section.boundarySupplementaryItems = [self.supplementaryStageHeaderItem]
                }
            
                return section
            }
        }
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
                withReuseIdentifier: RocketImageCollectionViewCell.identifier,
                for: indexPath
            ) as! RocketImageCollectionViewCell
            return cell
        case .specifications:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RocketSpecificationCollectionViewCell.identifier,
                for: indexPath
            ) as! RocketSpecificationCollectionViewCell
            return cell
        case .general:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RocketInfoCollectionViewCell.identifier,
                for: indexPath
            ) as! RocketInfoCollectionViewCell
            return cell
        case .firstStage, .secondStage:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RocketStageCollectionViewCell.identifier,
                for: indexPath
            ) as! RocketStageCollectionViewCell
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
