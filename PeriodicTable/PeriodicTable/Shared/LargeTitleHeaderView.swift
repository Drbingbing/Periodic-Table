//
//  LargeTitleHeaderView.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/16.
//

import UIKit
import SnapKit

final class LargeTitleHeaderView: UICollectionViewCell {
    
    private let label = UILabel()
    
    var text: String? {
        get { label.text }
        set { label.text = newValue }
    }
    
    var textAlignment: NSTextAlignment {
        get { label.textAlignment }
        set { label.textAlignment = newValue }
    }
    
    var font: UIFont {
        get { label.font }
        set { label.font = newValue }
    }
    
    var textColor: UIColor {
        get { label.textColor }
        set { label.textColor = newValue }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        
        label.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 2, left: 20, bottom: 2, right: 20))
        }
        label.textColor = .primaryLabel
        label.font = .boldSystemFont(ofSize: 24)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
