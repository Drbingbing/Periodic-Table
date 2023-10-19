//
//  EmbeddedCollectionViewCell.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/16.
//

import IGListKit
import UIKit

final class EmbeddedCollectionViewCell: UICollectionViewCell {

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.alwaysBounceVertical = false
        view.alwaysBounceHorizontal = false
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        self.contentView.addSubview(view)
        return view
    }()
    
    var scrollDirection: UICollectionView.ScrollDirection = .horizontal {
        didSet {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = scrollDirection 
            collectionView.setCollectionViewLayout(layout, animated: false)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.frame
    }
}
