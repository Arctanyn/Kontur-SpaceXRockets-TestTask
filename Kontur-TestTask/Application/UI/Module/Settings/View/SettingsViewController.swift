//
//  SettingsViewController.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 11.02.2023.
//

import UIKit

final class SettingsViewController: BaseViewController, PresentableView {
    
    typealias Presenter = SettingsPresenter
    
    //MARK: Properties
    
    var presenter: Presenter!
    
    //MARK: - Views
    
    private lazy var closeButton = UIBarButtonItem(
        title: "Close",
        style: .done,
        target: self,
        action: #selector(closeButtonDidTapped)
    )
    
    private lazy var settingsTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = .black
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        return tableView
    }()
    
    //MARK: - View Controller Lyfecycle
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.close()
    }
    
    //MARK: - Overrided Methods
    
    override func configureAppearance() {
        title = "Settings"
        navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItem = closeButton
        view.backgroundColor = .black
    }
    
    override func setupSubviews() {
        view.addSubview(settingsTableView, useAutoLayout: true)
        settingsTableView.dataSource = self
    }
    
    override func makeSubviewsLayout() {
        NSLayoutConstraint.activate([
            settingsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            settingsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            settingsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            settingsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: - Actions

@objc private extension SettingsViewController {
    func closeButtonDidTapped() {
        presenter.close()
    }
}

//MARK: - SettingsViewControllerProtocol

extension SettingsViewController: SettingsViewControllerProtocol {
    
}

//MARK: - UITableViewDataSource

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfSettings
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else {
            return UITableViewCell()
        }
        
        if let option = presenter.settingOptionForCell(at: indexPath) {
            cell.configure(with: option)
        }
        
        return cell
    }
 
}
