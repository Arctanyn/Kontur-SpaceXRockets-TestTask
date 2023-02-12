//
//  LaunchesViewController.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 11.02.2023.
//

import UIKit

final class LaunchesViewController: BaseViewController, PresentableView {
    
    typealias Presenter = LaunchesPresenter
    
    //MARK: Properties
    
    var presenter: Presenter!
    
    //MARK: - Views
    
    private lazy var launchesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())
        collectionView.allowsSelection = false
        collectionView.register(
            LaunchCollectionViewCell.self,
            forCellWithReuseIdentifier: LaunchCollectionViewCell.identifier
        )
        return collectionView
    }()
    
    //MARK: - View Controller Lyfecycle
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.finishFlow()
    }
    
    //MARK: - Overrided Methods
    
    override func configureAppearance() {
        view.backgroundColor = .black
        setupNavigationBar()
    }
    
    override func setupSubviews() {
        view.addSubview(launchesCollectionView, useAutoLayout: true)
        launchesCollectionView.dataSource = self
    }
    
    override func makeSubviewsLayout() {
        NSLayoutConstraint.activate([
            launchesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            launchesCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            launchesCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            launchesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - Private methods

private extension LaunchesViewController {
    func setupNavigationBar() {
        title = presenter.rocketName
        navigationController?.navigationBar.tintColor = .white
    }
    
    func makeCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let item = CompositionalLayoutHelper.createItem(
            widthDimension: .fractionalWidth(1),
            heightDimention: .fractionalHeight(1),
            contentInsets: .init(top: 20, leading: 0, bottom: 0, trailing: 0)
        )
                
        let group = CompositionalLayoutHelper.createGroup(
            alignment: .vertical,
            widthDimension: .fractionalWidth(1),
            heightDimention: .estimated(130),
            subitems: [item]
        )
        
        let section = CompositionalLayoutHelper.createSection(
            group: group,
            contentInsets: .init(top: 0, leading: 30, bottom: 0, trailing: 30)
        )
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

//MARK: - LaunchesViewControllerProtocol

extension LaunchesViewController: LaunchesViewControllerProtocol {
    func reloadData() {
        launchesCollectionView.reloadData()
    }
}

//MARK: - UICollectionViewDataSource

extension LaunchesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfLaunches
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchCollectionViewCell.identifier, for: indexPath) as? LaunchCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: presenter.viewModelForLauchCell(at: indexPath))
        return cell
    }
    
    
}
