//
//  AutoScrollImageView.swift
//  ShoppingApp
//
//  Created by Shailesh Aher on 10/6/18.
//  Copyright © 2018 Shailesh Aher. All rights reserved.
//

import UIKit

class AutoScrollImageView: UIView {

    var pageViewController : UIPageViewController?
    
    var models : [ImageModel] = [] {
        didSet {
            setup()
        }
    }
    
    private var controllerArray : [UIViewController] = []
    
    private func setup() {
        setupControllers()
        setupPageView()
        configurePageView()
    }
    
    private func setupControllers() {
        controllerArray = models.map { getController(for: $0) }
    }
    
    private func setupPageView() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        addSubview(pageViewController!.view)
    }
    
    private func configurePageView() {
        pageViewController?.dataSource = self
        pageViewController?.delegate = self
    }
    
    private func getController(for model: ImageModel) -> UIViewController {
        let controller = ImageViewController(model: model)
        return controller
    }
}

extension AutoScrollImageView : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = controllerArray.firstIndex(of: viewController)!
        return controllerArray[(index - 1) % models.count]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = controllerArray.firstIndex(of: viewController)!
        return controllerArray[(index + 1) % models.count]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return models.count
    }
}

extension AutoScrollImageView : UIPageViewControllerDelegate {
    
}
