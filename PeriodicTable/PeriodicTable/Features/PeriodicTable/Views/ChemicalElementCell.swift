//
//  ChemicalElementCell.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/13.
//

import UIKit
import IGListKit
import SnapKit
import SwifterSwift

final class ChemicalElementCell: UICollectionViewCell {
    
    private let symbolLabel = UILabel()
    private let atomicNumberLabel = UILabel()
    private let nameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubviews([symbolLabel, atomicNumberLabel, nameLabel])
        symbolLabel.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.trailing).offset(-8)
            make.top.equalTo(self.snp.top).offset(8)
        }
        atomicNumberLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(8)
            make.top.equalTo(self.snp.top).offset(8)
        }
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom).offset(-6)
            make.centerX.equalTo(self.snp.centerX)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populate(element: ChemicalElement?) {
        symbolLabel.text = element?.symbol ?? ""
        symbolLabel.font = .boldSystemFont(ofSize: 12)
        symbolLabel.textColor = .primaryLabel
        
        nameLabel.text = element?.name ?? ""
        nameLabel.font = .boldSystemFont(ofSize: 18)
        nameLabel.textColor = .primaryLabel
        
        atomicNumberLabel.text = element?.atomicNumber.string ?? ""
        atomicNumberLabel.font = .boldSystemFont(ofSize: 12)
        atomicNumberLabel.textColor = .primaryLabel
    }
}

extension ChemicalElementCell: ListBindable {
    
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? ChemicalElementViewModel else { return }
        
        symbolLabel.text = viewModel.symbol ?? ""
        symbolLabel.font = .boldSystemFont(ofSize: 12)
        symbolLabel.textColor = .primaryLabel
        
        nameLabel.text = viewModel.name
        nameLabel.font = .boldSystemFont(ofSize: 18)
        nameLabel.textColor = .primaryLabel
        
        atomicNumberLabel.text = viewModel.atomicNumber?.string ?? viewModel.range ?? ""
        atomicNumberLabel.font = .boldSystemFont(ofSize: 12)
        atomicNumberLabel.textColor = .primaryLabel
        
        layer.cornerRadius = 8
        layer.borderColor = UIColor(hex: viewModel.hex).cgColor
        layer.borderWidth = 1
        backgroundColor = UIColor(hex: viewModel.hex).withAlphaComponent(0.5)
    }
}
