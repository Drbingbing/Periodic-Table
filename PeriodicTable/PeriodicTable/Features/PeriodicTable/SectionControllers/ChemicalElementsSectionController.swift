//
//  ChemicalElementsSectionController.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/17.
//

import UIKit
import IGListKit
import IGListSwiftKit

final class ChemicalElementsSectionController: ListBindingSectionController<ListDiffable>, ListBindingSectionControllerDataSource {
    
    private lazy var elements = PeriodicTableUseCase().periodicTable()
    
    override init() {
        super.init()
        dataSource = self
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        return elements
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        switch viewModel {
        case is PlaceholderViewModel:
            return collectionContext.dequeueReusableCell(for: self, at: index) as EmptyCell
        case is ChemicalElementViewModel:
            return collectionContext.dequeueReusableCell(for: self, at: index) as ChemicalElementCell
        default: fatalError()
        }
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        return CGSize(width: 64, height: 64)
    }
    
    override func didHighlightItem(at index: Int) {
        let cell = collectionContext.cellForItem(at: index, sectionController: self)
        UIView.animate(withDuration: 0.3) {
            cell?.transform = .identity.scaledBy(x: 0.92, y: 0.92)
        }
    }
    
    override func didUnhighlightItem(at index: Int) {
        let cell = collectionContext.cellForItem(at: index, sectionController: self)
        UIView.animate(withDuration: 0.3) {
            cell?.transform = .identity
        }
    }
}
