//
//  ChemicalElementViewModel.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/20.
//

import Foundation

struct ChemicalElementViewModel: Equatable, Identifiable {
    let id = UUID()
    
    var atomicNumber: Int
    var symbol: String
    var name: String
    var category: String
    var originalName: String
    var hex: String
    
    init(
        atomicNumber: Int,
        symbol: String,
        name: String,
        originalName: String,
        category: String,
        hex: String
    ) {
        self.atomicNumber = atomicNumber
        self.symbol = symbol
        self.name = name
        self.category = category
        self.originalName = originalName
        self.hex = hex
    }
    
    init(element: ChemicalElement, hex: String) {
        self.init(
            atomicNumber: element.atomicNumber, 
            symbol: element.symbol,
            name: element.name,
            originalName: element.originalName,
            category: element.category,
            hex: hex
        )
    }
    
    static func empty() -> ChemicalElementViewModel {
        return ChemicalElementViewModel(
            atomicNumber: -1,
            symbol: "",
            name: "",
            originalName: "",
            category: "",
            hex: ""
        )
    }
    
    static func lanthanides() -> ChemicalElementViewModel {
        return ChemicalElementViewModel(
            atomicNumber: 57,
            symbol: "",
            name: "鑭系",
            originalName: "Lanthanides",
            category: "鑭系元素",
            hex: "E0AAFF"
        )
    }
    
    static func actinides() -> ChemicalElementViewModel {
        return ChemicalElementViewModel(
            atomicNumber: 57,
            symbol: "",
            name: "錒系",
            originalName: "Actinides",
            category: "錒系元素",
            hex: "EC91D8"
        )
    }
}
