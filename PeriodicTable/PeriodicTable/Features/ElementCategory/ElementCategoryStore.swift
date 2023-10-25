//
//  ElementCategoryStore.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/23.
//

import Foundation
import ComposableArchitecture

struct ElementCategoryStore: Reducer {
    
    @Dependency(\.categoryClient) var client
    @Dependency(\.colorCoded) var colorCoded
    
    struct State: Equatable {
        var categories: [ElementCategoryViewModel] = []
        var isLoading = false
    }
    
    enum Action {
        case allCategories
        case categoriesResponse(TaskResult<[ElementCategoryViewModel]>)
        case dismiss
        case selected(ElementCategoryViewModel)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .allCategories:
                if state.categories.isEmpty {
                    state.isLoading = true
                }
                return .run { send in
                    await send(
                        .categoriesResponse(
                            TaskResult {
                                let cates = try await self.client.allCategories()
                                var categories = cates.map {
                                    let hex = colorCoded.hex($0.name)
                                    return ElementCategoryViewModel(name: $0.name, hex: hex)
                                }
                                categories.append(
                                    ElementCategoryViewModel(name: "所有元素", hex: "C9D6EA")
                                )
                                return categories
                            }
                        )
                    )
                }
            case let .categoriesResponse(.success(cates)):
                state.isLoading = false
                state.categories = cates
                return .none
            case .categoriesResponse(.failure):
                return .none
            case .dismiss:
                return .none
            case .selected:
                return .send(.dismiss)
            }
        }
    }
}
