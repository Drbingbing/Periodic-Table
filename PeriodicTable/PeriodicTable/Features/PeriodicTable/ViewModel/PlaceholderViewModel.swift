//
//  PlaceholderViewModel.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/18.
//

import Foundation
import IGListDiffKit

final class PlaceholderViewModel {
    let id: UUID = UUID()
}

extension PlaceholderViewModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? PlaceholderViewModel else { return false }
        return id == object.id
    }
}
