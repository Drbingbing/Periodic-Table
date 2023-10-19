//
//  NumberSectionController.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/17.
//

import UIKit
import IGListKit
import IGListSwiftKit

final class NumberSectionController: ListSectionController {
    
    private var number: Int?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: 64, height: 64)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext.dequeueReusableCell(for: self, at: index) as NumberCell
        cell.label.text = "\(number ?? 0)"
        return cell
    }
    
    override func didUpdate(to object: Any) {
        number = object as? Int
    }
}
