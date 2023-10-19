//
//  ChemicalElement.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/13.
//

import Foundation
import IGListKit

class ChemicalElement: Decodable {
    
    let atomicNumber: Int
    let name: String
    let symbol: String
    let period: Int
    let group: Int
    let category: Category
    
    init(atomicNumber: Int, name: String, symbol: String, group: Int, period: Int, category: Category) {
        self.atomicNumber = atomicNumber
        self.name = name
        self.symbol = symbol
        self.period = period
        self.group = group
        self.category = category
    }
    
    private enum CodingKeys: String, CodingKey {
        case name, symbol, period, group, category
        case atomicNumber = "atomic_number"
    }
    
    enum Category: String, Codable {
        case alkalineEearthMetal = "鹼土金屬"
        case alkaliMetal = "鹼金屬"
        case lanthanide = "鑭系元素"
        case actinide = "錒系元素"
        case transitionMetal = "過渡金屬"
        case postTransitionMetal = "貧金屬"
        case nonmetal = "非金屬"
        case nobleGas = "惰性氣體"
        case metalloid = "類金屬"
        case halogen = "鹵素"
        case unknown = "未知"
    }
}

extension ChemicalElement: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return name as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? ChemicalElement else { return false }
        return symbol == object.symbol && name == object.name
    }
}
