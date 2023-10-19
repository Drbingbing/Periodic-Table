//
//  NumberViewModel.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/16.
//

import Foundation
import IGListDiffKit

final class NumberViewModel {
    
    let number: Int
    
    init(number: Int) {
        self.number = number
    }
}

extension NumberViewModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return number as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? NumberViewModel else { return false }
        return number == object.number
    }
}
