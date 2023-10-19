//
//  PeriodicTable.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/16.
//

import Foundation
import IGListDiffKit

class PeriodicTable: Decodable {
    
    let elements: [ChemicalElement]
    
    init(elements: [ChemicalElement]) {
        self.elements = elements
    }
}

extension PeriodicTable: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return "periodic table" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return true
    }
}

