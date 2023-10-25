//
//  ElementCategoryViewModel.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/23.
//

import Foundation

struct ElementCategoryViewModel: Equatable, Identifiable {
    
    var id: String { return name }
    
    var name: String
    var hex: String
    
    init(name: String, hex: String) {
        self.name = name
        self.hex = hex
    }
}
