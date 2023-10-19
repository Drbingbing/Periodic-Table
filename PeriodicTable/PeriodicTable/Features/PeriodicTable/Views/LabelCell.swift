//
//  LabelCell.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/18.
//

import UIKit
import SnapKit
import IGListKit

final class LabelCell: UICollectionViewCell {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 18)
        label.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
