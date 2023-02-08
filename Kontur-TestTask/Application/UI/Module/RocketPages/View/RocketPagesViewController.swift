//
//  RocketPagesViewController.swift
//  Kontur-TestTask
//
//  Created by Малиль Дугулюбгов on 07.02.2023.
//

import UIKit

final class RocketPagesViewController: UIPageViewController, PresentableView {

    typealias Presenter = RocketPagesPresenter
    
    //MARK: Properties
    
    var presenter: Presenter!
    
    private var myViewControllers = [UIViewController]()
    
    //MARK: - Initialization
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle,
                  navigationOrientation: UIPageViewController.NavigationOrientation,
                  options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View Controller Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

//MARK: - Private methods

 extension RocketPagesViewController {
    func configure() {
        dataSource = self
    }

    func findIndex(of viewController: UIViewController) -> Int? {
        myViewControllers.firstIndex(of: viewController)
    }
}

//MARK: - RocketPagesViewControllerProtocol

extension RocketPagesViewController: RocketPagesViewControllerProtocol {
    
}

//MARK: - UIPageViewControllerDataSource

extension RocketPagesViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = findIndex(of: viewController) else {
            return nil
        }
        return index == 0 ? nil : myViewControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = findIndex(of: viewController) else {
            return nil
        }
        return viewController == myViewControllers.last ? nil : myViewControllers[index + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return myViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}
