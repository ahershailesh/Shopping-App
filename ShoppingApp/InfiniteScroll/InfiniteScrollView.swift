//
//  InfiniteScrollView.swift
//  ShoppingApp
//
//  Created by Shailesh Aher on 10/4/18.
//  Copyright © 2018 Shailesh Aher. All rights reserved.
//

import UIKit

struct ImageModel {
    var image: Data?
    var cornerRadius : CGFloat = 4.0
}

final class InfiniteScrollView : UIView {
    
    var collectionView : UICollectionView?
    
    private let VERTICLE_MARGINE : CGFloat = 4.0
    private let HORIZONTAL_SPACING : CGFloat = 4.0
    private let INTER_ITEM_SPACING : CGFloat = 4.0
    
    var models : [ImageModel] = [] {
        didSet {
            setupView()
        }
    }
    
    private func setupView() {
        setupCollectionView()
        registerCells()
        setupProperties()
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: frame, collectionViewLayout: getLayout())
        addSubview(collectionView!)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: INTER_ITEM_SPACING, height: frame.height))
        collectionView?.addSubview(view)
    }
    
    private func registerCells() {
        collectionView?.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: ImageCollectionViewCell.self))
    }
    
    private func setupProperties() {
        collectionView?.backgroundColor = .white
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.isPagingEnabled = true
        collectionView?.contentOffset = CGPoint(x: INTER_ITEM_SPACING, y: 0)
    }
    
    private func getLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = getSize()
        layout.minimumInteritemSpacing = INTER_ITEM_SPACING
        layout.scrollDirection = .horizontal
        return layout
    }
}

//MARK:- UICollectionViewDataSource
extension InfiniteScrollView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ImageCollectionViewCell.self), for: indexPath) as? ImageCollectionViewCell
        cell?.model = models[indexPath.row % models.count] 
        return cell ?? ImageCollectionViewCell(frame: .zero)
    }
}

//MARK:- UICollectionViewDelegateFlowLayout
extension InfiniteScrollView : UICollectionViewDelegateFlowLayout {
    
    private func getSize() -> CGSize {
        let width : CGFloat = frame.width - 2 * INTER_ITEM_SPACING
        let size = CGSize(width: width, height: frame.height)
        return size
    }
}
