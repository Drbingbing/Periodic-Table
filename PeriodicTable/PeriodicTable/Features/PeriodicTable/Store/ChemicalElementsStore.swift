//
//  ChemicalElementsStore.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/20.
//

import Foundation
import ComposableArchitecture

struct ChemicalElementsStore: Reducer {
    
    struct State: Equatable {
        var table: [[ChemicalElementViewModel?]] = []
        var category: ElementCategoryViewModel?
    }
    
    enum Action {
        
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}
