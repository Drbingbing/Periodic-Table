//
//  LargeTitleSectionController.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/16.
//

import UIKit
import IGListKit
import IGListSwiftKit

final class LargeTitleSectionController: ListSectionController {
    
    private var title: String?
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
    }
    
    override func didUpdate(to object: Any) {
        title = object as? String
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext.dequeueReusableCell(for: self, at: index) as LargeTitleCell
        
        cell.text = title
        
        return cell
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext.containerSize.width - 28, height: 55)
    }
}
