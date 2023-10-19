//
//  PeriodicTableCell.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/17.
//

import UIKit
import IGListKit

final class PeriodicTableCell: UICollectionViewCell {
    
    private let elementsAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: nil)
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .clear
        view.alwaysBounceVertical = false
        view.alwaysBounceHorizontal = false
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        return view
    }()
    private let periodsAdpater = ListAdapter(updater: ListAdapterUpdater(), viewController: nil)
    private lazy var periodsCollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.backgroundColor = .clear
        view.alwaysBounceVertical = false
        view.alwaysBounceHorizontal = false
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private let groupAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: nil)
    private lazy var groupCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.alwaysBounceVertical = false
        view.alwaysBounceHorizontal = false
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(collectionView)
        
        elementsAdapter.dataSource = self
        elementsAdapter.collectionView = collectionView
        
        contentView.addSubview(periodsCollectionView)
        
        periodsAdpater.collectionView = periodsCollectionView
        periodsAdpater.dataSource = self
        
        contentView.addSubview(groupCollectionView)
        groupAdapter.collectionView = groupCollectionView
        groupAdapter.dataSource = self
        
        periodsCollectionView.snp.makeConstraints { make in
            make.width.equalTo(32)
            make.top.equalTo(self.snp.top).offset(52)
            make.leading.equalTo(self.snp.leading).offset(20)
            make.height.equalTo(64 * 7)
        }
        
        groupCollectionView.snp.makeConstraints { make in
            make.leading.equalTo(periodsCollectionView.snp.trailing).offset(8)
            make.top.equalTo(self.snp.top).offset(12)
            make.trailing.equalTo(self.snp.trailing).inset(12)
            make.height.equalTo(32)
        }
        collectionView.snp.makeConstraints { make in
            make.leading.equalTo(periodsCollectionView.snp.trailing).offset(8)
            make.top.equalTo(groupCollectionView.snp.bottom).offset(8)
            make.bottom.equalTo(self.snp.bottom)
            make.trailing.equalTo(groupCollectionView.snp.trailing)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        periodsCollectionView.layer.cornerRadius = 8
        periodsCollectionView.backgroundColor = UIColor(hex: "F3D5B5")
        groupCollectionView.layer.cornerRadius = 8
        groupCollectionView.backgroundColor = UIColor(hex: "F3D5B5")
    }
}

extension PeriodicTableCell: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        if listAdapter == periodsAdpater {
            return (1...7).map { $0 as ListDiffable }
        }
        if listAdapter == groupAdapter {
            return (1...18).map { $0 as ListDiffable }
        }
        
        return ["table", "l", "a"].map { $0 as ListDiffable }
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case let o as String:
            if o == "l" {
                return LanthanideSectionController()
            }
            if o == "a" {
                return ActinideSectionController()
            }
            return ChemicalElementsSectionController()
        case is Int:
            return NumberSectionController()
        default:
            fatalError()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
