//
//  ChemicalElement.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/20.
//

import Foundation

struct ChemicalElementResults: Codable {
    let result: [ChemicalElement]
    
    private enum CodingKeys: String, CodingKey {
        case result = "elements"
    }
}

struct ChemicalElement: Codable {
    
    let atomicNumber: Int
    let name: String
    let symbol: String
    let period: Int
    let group: Int
    let category: String
    let originalName: String
    
    init(atomicNumber: Int, name: String, symbol: String, group: Int, period: Int, category: String, originalName: String) {
        self.atomicNumber = atomicNumber
        self.name = name
        self.symbol = symbol
        self.period = period
        self.group = group
        self.category = category
        self.originalName = originalName
    }
    
    private enum CodingKeys: String, CodingKey {
        case name, symbol, period, group, category
        case atomicNumber = "atomic_number"
        case originalName = "original_name"
    }
    
}
