//
//  ViewController.swift
//  ShoppingApp
//
//  Created by Shailesh Aher on 10/4/18.
//  Copyright © 2018 Shailesh Aher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var collectionView : InfiniteScrollView?
    
    private func getController(for model: ImageModel) -> UIViewController {
        let controller = ImageViewController(model: model)
        return controller
    }
    
    private var controllerArray : [UIViewController] = []
    
    private func setupControllers() {
        controllerArray = getModels().map { getController(for: $0) }
    }
    
    override func viewDidLoad() {
        setupControllers()
        super.viewDidLoad()
        let scrollView = AutoScrollImageView(frame: CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: 100)))
        view.addSubview(scrollView)
        scrollView.models = getModels()
        scrollView.pageViewController!.dataSource = self
        scrollView.pageViewController!.delegate = self
        present(scrollView.pageViewController!, animated: true, completion: nil)
    }
    
    private func getModels() -> [ImageModel] {
        let model = ImageModel()
        return Array<ImageModel>(repeating: model, count: 5)
    }
}


extension ViewController : UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = controllerArray.firstIndex(of: viewController)!
        return controllerArray[(index - 1) % controllerArray.count]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = controllerArray.firstIndex(of: viewController)!
        return controllerArray[(index + 1) % controllerArray.count]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllerArray.count
    }
}

extension ViewController : UIPageViewControllerDelegate {
    
}
