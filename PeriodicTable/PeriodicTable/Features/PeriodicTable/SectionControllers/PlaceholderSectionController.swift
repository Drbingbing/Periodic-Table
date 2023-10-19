//
//  PlaceholderSectionController.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/18.
//

import UIKit
import IGListKit
import IGListSwiftKit

final class PlaceholderSectionController: ListSectionController {
    
    private var placeholder: PlaceholderViewModel?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: 64, height: 64)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        return collectionContext.dequeueReusableCell(for: self, at: index) as EmptyCell
    }
    
    override func didUpdate(to object: Any) {
        placeholder = object as? PlaceholderViewModel
    }
}
