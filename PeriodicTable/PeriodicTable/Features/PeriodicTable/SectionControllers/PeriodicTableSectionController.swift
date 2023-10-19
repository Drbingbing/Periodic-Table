//
//  PeriodicTableSectionController.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/13.
//

import UIKit
import IGListKit
import IGListSwiftKit

final class PeriodicTableSectionController: ListSectionController {
//    
//    lazy var adapter: ListAdapter = {
//        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: viewController)
//        adapter.dataSource = self
//        return adapter
//    }()
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
//        adapter.collectionView = cell.collectionView
        return collectionContext.dequeueReusableCell(for: self, at: index) as PeriodicTableCell
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext.containerSize.width, height: collectionContext.containerSize.height)
    }
}

//MARK: - ListAdapterDataSource
//extension PeriodicTableSectionController: ListAdapterDataSource {
//    
//    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
//        return [PeriodicTableViewModel(elements: useCase.elements)]
//    }
//    
//    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
//        return ChemicalElementSectionController(useCase: useCase)
//    }
//    
//    func emptyView(for listAdapter: ListAdapter) -> UIView? {
//        return nil
//    }
//}
