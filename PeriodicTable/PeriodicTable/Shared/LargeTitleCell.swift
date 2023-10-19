//
//  LargeTitleCell.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/16.
//

import UIKit
import SnapKit

final class LargeTitleCell: UICollectionViewCell {
    
    private let label = UILabel()
    
    var text: String? {
        get { label.text }
        set { label.text = newValue }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        
        label.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        label.textColor = .primaryLabel
        label.font = .boldSystemFont(ofSize: 24)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        // note: don't change the width
        newFrame.size.height = ceil(size.height)
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }

}
