//
//  ImageCollectionViewCell.swift
//  ShoppingApp
//
//  Created by Shailesh Aher on 10/6/18.
//  Copyright © 2018 Shailesh Aher. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    //MARK:- Vars
    //MARK:- IBOutlet
    private var imageView = UIImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCell()
    }
    
    //MARK:- Public
    var model : ImageModel? {
        didSet {
            guard let model = model else { return }
            setupImage(for: model)
        }
    }
    
    //MARK:- Methods
    //MARK:- Lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        clearSetup()
    }
    
    //MARK:- Private
    private func setupCell() {
        contentView.backgroundColor = UIColor.lightGray
        contentView.layer.cornerRadius = 4
        contentView.addSubview(imageView) 
        addContraints()
    }
    
    private func setupImage(for model: ImageModel) {
        imageView.layer.cornerRadius = model.cornerRadius
        contentView.addSubview(imageView)
    }
    
    private func addContraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let viewDict = ["imageView" : imageView]
        var vfl = "H:|-0-[imageView]-0-|"
        var contraints = NSLayoutConstraint.constraints(withVisualFormat: vfl, options: .alignAllCenterY, metrics: nil, views: viewDict)
        NSLayoutConstraint.activate(contraints)
        
        vfl = "V:|-0-[imageView]-0-|"
        contraints = NSLayoutConstraint.constraints(withVisualFormat: vfl, options: .alignAllCenterX, metrics: nil, views: viewDict)
        NSLayoutConstraint.activate(contraints)
    }
    
    private func clearSetup() {
        imageView.image = nil
        backgroundColor = UIColor.lightGray
    }
}
