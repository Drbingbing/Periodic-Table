//
//  ActinideSectionController.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/18.
//

import UIKit
import IGListKit
import IGListSwiftKit


final class ActinideSectionController: ListSectionController {
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
    }
    
    private lazy var elements: [ChemicalElement] = {
        let useCase = PeriodicTableUseCase()
        return useCase.objects
            .filter { $0.category == .actinide }
    }()
    
    override func sizeForItem(at index: Int) -> CGSize {
        if index == 0 {
            return CGSize(width: 64 * 3, height: 64)
        }
        
        return CGSize(width: 64, height: 64)
    }
    
    override func numberOfItems() -> Int {
        return elements.count + 1
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        if index == 0 {
            let cell = collectionContext.dequeueReusableCell(for: self, at: index) as LabelCell
            cell.label.textAlignment = .right
            cell.label.text = "錒系元素"
            return cell
        }
        
        let element = elements[index - 1]
        
        let cell = collectionContext.dequeueReusableCell(for: self, at: index) as ChemicalElementCell
        cell.populate(element: element)
        cell.layer.cornerRadius = 8
        cell.layer.borderColor = UIColor.elementPinkRed.cgColor
        cell.layer.borderWidth = 1
        cell.backgroundColor = .elementPinkRed.withAlphaComponent(0.5)
        
        return cell
    }
    
    override func didHighlightItem(at index: Int) {
        if index == 0 { return }
        let cell = collectionContext.cellForItem(at: index, sectionController: self)
        UIView.animate(withDuration: 0.3) {
            cell?.transform = .identity.scaledBy(x: 0.92, y: 0.92)
        }
    }
    
    override func didUnhighlightItem(at index: Int) {
        if index == 0 { return }
        
        let cell = collectionContext.cellForItem(at: index, sectionController: self)
        UIView.animate(withDuration: 0.3) {
            cell?.transform = .identity
        }
    }
}
