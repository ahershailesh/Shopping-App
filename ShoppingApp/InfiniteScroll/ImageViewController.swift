//
//  ImageViewController.swift
//  ShoppingApp
//
//  Created by Shailesh Aher on 10/6/18.
//  Copyright © 2018 Shailesh Aher. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    private let model: ImageModel
    
    required init(model: ImageModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(model: ImageModel())
    }
}
