//
//  PeriodicTableSortSectionController.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/18.
//

import UIKit
import IGListKit
import IGListSwiftKit

final class PeriodicTableSortSectionController: ListBindingSectionController<ListDiffable>, ListBindingSectionControllerDataSource, ListSupplementaryViewSource {
    
    private let sort: PeriodicTableSort
    
    init(sort: PeriodicTableSort) {
        self.sort = sort
        super.init()
        dataSource = self
        inset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        minimumLineSpacing = 4
        supplementaryViewSource = self
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        guard let viewModel = object as? PeriodicTableSortViewModel else { return [] }
        
        return viewModel.elements
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        switch viewModel {
        case is ChemicalElementViewModel:
            return collectionContext.dequeueReusableCell(for: self, at: index) as ChemicalElementCell
        default:
            fatalError()
        }
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        return CGSize(width: 64, height: 64)
    }
    
    // MARK: - ListSupplementaryViewSource
    
    func supportedElementKinds() -> [String] {
        return [UICollectionView.elementKindSectionHeader]
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        return CGSize(width: collectionContext.containerSize.width, height: 40)
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        
        let headerPrefix: String
        switch sort {
        case .byTable:
            headerPrefix = ""
        case .byAtomicNumber:
            headerPrefix = "原子序"
        case .byPeriod:
            headerPrefix = "週期"
        case .byGroup:
            headerPrefix = "族"
        }
        
        let cell = collectionContext.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            forSectionController: self,
            atIndex: index
        ) as LargeTitleHeaderView
        
        cell.textAlignment = .center
        cell.text = "\(headerPrefix)\(section + 1)"
        cell.font = .boldSystemFont(ofSize: 18)
        cell.backgroundColor = UIColor(hex: "F3D5B5")
        
        return cell
    }
}
