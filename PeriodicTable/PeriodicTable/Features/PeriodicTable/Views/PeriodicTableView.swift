//
//  PeriodicTableView.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/19.
//

import SwiftUI
import ComposableArchitecture

struct PeriodicTableView: View {
    
    var store: StoreOf<PeriodicTableStore>
    
    init() {
        self.store = Store(
            initialState: PeriodicTableStore.State(),
            reducer: { PeriodicTableStore() }
        )
    }
    
    var body: some View {
        NavigationStack {
            WithViewStore(store, observe: { $0 }) { viewStore in
                ScrollView(showsIndicators: false) {
                    ChemicalElementsView(
                        store: Store(
                            initialState: viewStore.chemicalState,
                            reducer: { ChemicalElementsStore() }
                        )
                    )
                    .padding(20)
                    .animation(.default, value: viewStore.chemicalState)
                    
                    Color.clear.frame(height: 40)
                }
                .onAppear {
                    store.send(.allElements)
                }
                .navigationTitle(Text("週期表"))
                .toolbar {
                    ToolbarItem {
                        Button(action: { viewStore.send(.showCategory) }) {
                            Image("list")
                        }
                    }
                }
                .sheet(
                    store: store.scope(
                        state: \.$presentation,
                        action: PeriodicTableStore.Action.presentation
                    )
                ) { store in
                    ElementCategoryView(store: store)
                }
            }
        }
        .background(Color.primaryBackground)
    }
}

private struct TopBar: View {
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...18, id: \.self) { index in
                Text("\(index)")
                    .frame(minWidth: 80, minHeight: 42)
                    .foregroundStyle(Color.primaryApp)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
            }
        }
        .background(Color.backgroundBrown)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

private struct SideBar: View {
    var body: some View {
        VStack(spacing: 4) {
            ForEach(1...7, id: \.self) { index in
                Text("\(index)")
                    .frame(minWidth: 42, minHeight: 80)
                    .foregroundStyle(Color.primaryApp)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
            }
        }
        .background(Color.backgroundBrown)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    PeriodicTableView()
}
