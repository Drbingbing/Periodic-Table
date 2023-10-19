//
//  PeriodicTableSortViewModel.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/18.
//

import Foundation
import IGListDiffKit

final class PeriodicTableSortViewModel: ListDiffable {
    
    let id: UUID = UUID()
    
    var elements: [ListDiffable]
    
    init(elements: [ListDiffable]) {
        self.elements = elements
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? PeriodicTableSortViewModel else { return false }
        return id == object.id
    }
}
