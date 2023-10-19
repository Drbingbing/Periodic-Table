//
//  ChemicalElementViewModel.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/13.
//

import Foundation
import IGListDiffKit

final class ChemicalElementViewModel {
    let id = UUID()
    let atomicNumber: Int?
    let symbol: String?
    let name: String
    let hex: String
    let range: String?
    
    init(atomicNumber: Int? = nil, symbol: String? = nil, name: String, hex: String, range: String? = nil) {
        self.atomicNumber = atomicNumber
        self.symbol = symbol
        self.name = name
        self.range = range
        self.hex = hex
    }
}

extension ChemicalElementViewModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? ChemicalElementViewModel else { return false }
        return id == object.id
    }

}
