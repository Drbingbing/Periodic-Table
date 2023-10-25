//
//  ChemicalElementsView.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/20.
//

import SwiftUI
import ComposableArchitecture

struct ChemicalElementsView: View {
    
    var store: StoreOf<ChemicalElementsStore>
    
    init(store: StoreOf<ChemicalElementsStore>) {
        self.store = store
    }
    
    private var columns: [GridItem] = (0..<18).map { _ in GridItem(.fixed(80)) }
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            Grid(horizontalSpacing: 10, verticalSpacing: 6) {
                ForEach(0..<viewStore.table.count, id: \.self) { x in
                    GridRow {
                        let row = viewStore.table[x]
                        ForEach(0..<row.count, id: \.self) { y in
                            if let viewModel = row[y] {
                                ChemicalElementView(viewModel: viewModel, category: viewStore.category, onTap: {})
                                    .frame(width: 80, height: 100)
                            } else {
                                Color.clear
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ScrollView {
        ChemicalElementsView(
            store: Store(
                initialState: ChemicalElementsStore.State(),
                reducer: { ChemicalElementsStore() }
            )
        )
        .padding(20)
    }
    
}
