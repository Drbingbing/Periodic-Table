//
//  ElementCategoryView.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/23.
//

import SwiftUI
import ComposableArchitecture

struct ElementCategoryView: View {
    
    var store: StoreOf<ElementCategoryStore>
    
    init(store: StoreOf<ElementCategoryStore>) {
        self.store = store
    }
        
    private var columns: [GridItem] = (0..<3).map { _ in GridItem(.fixed(150), spacing: 20) }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 28) {
                HStack {
                    Text("分類")
                        .foregroundStyle(Color.primaryApp)
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 12)
                WithViewStore(store, observe: { $0 }) { viewStore in
                    if viewStore.isLoading {
                        ProgressView()
                            .padding(.horizontal, 32)
                            .padding(.bottom, 32)
                    } else {
                        LazyVGrid(columns: columns, spacing: 32) {
                            ForEach(viewStore.categories) { category in
                                Button(action: { viewStore.send(.selected(category)) }) {
                                    HStack(spacing: 8) {
                                        Color(hex: category.hex)
                                            .frame(width: 16, height: 16)
                                            .clipShape(Circle())
                                        Text(category.name)
                                            .font(.system(size: 18))
                                            .fontWeight(.medium)
                                            .foregroundStyle(Color.primaryText)
                                        Spacer()
                                    }
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 32)
                        .padding(.bottom, 20)
                    }
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(20)
            .onAppear {
                store.send(.allCategories)
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: { store.send(.dismiss) }) {
                        Text("關閉")
                            .padding(.bottom, 8)
                            .foregroundStyle(Color.primaryApp)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    ElementCategoryView(
        store: Store(
            initialState: ElementCategoryStore.State(),
            reducer: { ElementCategoryStore() }
        )
    )
}
