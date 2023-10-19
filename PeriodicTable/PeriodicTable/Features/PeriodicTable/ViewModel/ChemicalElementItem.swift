//
//  ChemicalElementGroup.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/16.
//

import IGListKit
import IGListSwiftKit

final class ChemicalElementItem: NSObject {
    
    let items: [ChemicalElement]
    
    init(items: [ChemicalElement]) {
        self.items = items
    }
}

extension ChemicalElementItem: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return self
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return self === object ? true : self.isEqual(object)
    }

}
