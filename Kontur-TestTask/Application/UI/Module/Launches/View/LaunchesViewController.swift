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
    private var fetchLaunchesTask: Task<Void, Never>?
    
    //MARK: - Views
    
    private lazy var loadingIndicator = UIActivityIndicatorView.loadingIndicator
    
    private lazy var noResultsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "No information about launches"
        return label
    }()
    
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
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        fetchLaunchesTask?.cancel()
    }
    
    //MARK: - Overrided Methods
    
    override func configureAppearance() {
        view.backgroundColor = .black
        setupNavigationBar()
    }
    
    override func setupSubviews() {
        setupCollectionView()
        setupNoResultsLabel()
        view.addSubview(loadingIndicator, useAutoLayout: true)
    }
    
    override func makeSubviewsLayout() {
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            noResultsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            noResultsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            noResultsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),

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
    
    func setupCollectionView() {
        view.addSubview(launchesCollectionView, useAutoLayout: true)
        launchesCollectionView.dataSource = self
    }
    
    func setupNoResultsLabel() {
        view.addSubview(noResultsLabel, useAutoLayout: true)
        noResultsLabel.isHidden = true
    }
}

//MARK: - LaunchesViewControllerProtocol

extension LaunchesViewController: LaunchesViewControllerProtocol {
    func reloadData() {
        launchesCollectionView.reloadData()
    }
    
    func displayLaunchesAbsence() {
        launchesCollectionView.isHidden = true
        noResultsLabel.isHidden = false
    }
    
    func startLoadingIndicator() {
        loadingIndicator.startAnimating()
    }
    
    func stopLoadingIndicator() {
        loadingIndicator.stopAnimating()
    }
    
    func showErrorAlert(description: String) {
        let alert = UIAlertController(title: "Error", message: description, preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title: "OK", style: .cancel)
        )
        
        alert.addAction(
            UIAlertAction(title: "Try again", style: .default) { [weak self] _ in
                self?.fetchLaunchesTask = Task {
                    await self?.presenter.fetchLaunches()
                }
            }
        )
        
        present(alert, animated: true)
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
