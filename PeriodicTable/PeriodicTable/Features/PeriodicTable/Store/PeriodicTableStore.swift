//
//  PeriodicTableStore.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/20.
//

import Foundation
import ComposableArchitecture

struct PeriodicTableStore: Reducer {
    
    @Dependency(\.chemicalClient) var client
    @Dependency(\.colorCoded) var colorCoded
    
    
    struct State: Equatable {
        var chemicalState: ChemicalElementsStore.State = .init()
        var categories: [ElementCategoryViewModel] = []
        @PresentationState var presentation: ElementCategoryStore.State?
    }
    
    enum Action {
        case allElements
        case elementsResponse(TaskResult<[[ChemicalElementViewModel?]]>)
        case showCategory
        case colorTableResponse(TaskResult<[ColorCoded]>)
        case presentation(PresentationAction<ElementCategoryStore.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .allElements:
                return .concatenate(
                    .run { send in
                        await send(
                            .colorTableResponse(
                                TaskResult { try await self.colorCoded.colorTable() }
                            )
                        )
                    },
                    .run { send in
                        await send(
                            .elementsResponse(
                                TaskResult {
                                    let elements = try await self.client.discoveredElements()
                                    var table: [[ChemicalElementViewModel?]] = []
                                    for index in (0..<7) {
                                        var row = [ChemicalElementViewModel?](repeating: nil, count: 18)
                                        if index == 0 {
                                            row[0] = ChemicalElementViewModel(element: elements[0], hex: self.colorCoded.hex(elements[0].category))
                                            row[17] = ChemicalElementViewModel(element: elements[1], hex: self.colorCoded.hex(elements[1].category))
                                            table.append(row)
                                        }
                                        if index == 1 {
                                            row[0] = ChemicalElementViewModel(element: elements[2], hex: self.colorCoded.hex(elements[2].category))
                                            row[1] = ChemicalElementViewModel(element: elements[3], hex: self.colorCoded.hex(elements[3].category))
                                            row[12] = ChemicalElementViewModel(element: elements[4], hex: self.colorCoded.hex(elements[4].category))
                                            row[13] = ChemicalElementViewModel(element: elements[5], hex: self.colorCoded.hex(elements[5].category))
                                            row[14] = ChemicalElementViewModel(element: elements[6], hex: self.colorCoded.hex(elements[6].category))
                                            row[15] = ChemicalElementViewModel(element: elements[7], hex: self.colorCoded.hex(elements[7].category))
                                            row[16] = ChemicalElementViewModel(element: elements[8], hex: self.colorCoded.hex(elements[8].category))
                                            row[17] = ChemicalElementViewModel(element: elements[9], hex: self.colorCoded.hex(elements[9].category))
                                            table.append(row)
                                        }
                                        if index == 2 {
                                            row[0] = ChemicalElementViewModel(element: elements[10], hex: self.colorCoded.hex(elements[10].category))
                                            row[1] = ChemicalElementViewModel(element: elements[11], hex: self.colorCoded.hex(elements[11].category))
                                            row[12] = ChemicalElementViewModel(element: elements[12], hex: self.colorCoded.hex(elements[12].category))
                                            row[13] = ChemicalElementViewModel(element: elements[13], hex: self.colorCoded.hex(elements[13].category))
                                            row[14] = ChemicalElementViewModel(element: elements[14], hex: self.colorCoded.hex(elements[14].category))
                                            row[15] = ChemicalElementViewModel(element: elements[15], hex: self.colorCoded.hex(elements[15].category))
                                            row[16] = ChemicalElementViewModel(element: elements[16], hex: self.colorCoded.hex(elements[16].category))
                                            row[17] = ChemicalElementViewModel(element: elements[17], hex: self.colorCoded.hex(elements[17].category))
                                            table.append(row)
                                        }
                                        if index == 3 {
                                            (18...35).enumerated().forEach {
                                                row[$0.offset] = ChemicalElementViewModel(element: elements[$0.element], hex: self.colorCoded.hex(elements[$0.element].category))
                                            }
                                            table.append(row)
                                        }
                                        if index == 4 {
                                            (36...53).enumerated().forEach {
                                                row[$0.offset] = ChemicalElementViewModel(element: elements[$0.element], hex: self.colorCoded.hex(elements[$0.element].category))
                                            }
                                            table.append(row)
                                        }
                                        if index == 5 {
                                            (54...71).enumerated().forEach {
                                                let offset = $0.element >= 57 ? $0.element + 14 : $0.element
                                                row[$0.offset] = ChemicalElementViewModel(element: elements[offset], hex: self.colorCoded.hex(elements[offset].category))
                                            }
                                            table.append(row)
                                        }
                                        if index == 6 {
                                            (86...103).enumerated().forEach {
                                                let offset = $0.element >= 89 ? $0.element + 14 : $0.element
                                                row[$0.offset] = ChemicalElementViewModel(element: elements[offset], hex: self.colorCoded.hex(elements[offset].category))
                                            }
                                            table.append(row)
                                        }
                                    }
                                    
                                    return table
                                }
                            )
                        )
                    }
                )
            case let .elementsResponse(.success(table)):
                state.chemicalState = .init(table: table)
                return .none
            case .elementsResponse(.failure):
                return .none
            case .showCategory:
                state.presentation = ElementCategoryStore.State(categories: state.categories)
                return .none
            case let .presentation(.presented(.categoriesResponse(.success(cates)))):
                state.categories = cates
                return .none
            case .presentation(.presented(.dismiss)):
                state.presentation = nil
                return .none
            case let .presentation(.presented(.selected(viewModel))):
                state.chemicalState = .init(
                    table: state.chemicalState.table,
                    category: viewModel.name == "所有元素" ? nil : viewModel
                )
                return .none
            case .presentation:
                return .none
            case .colorTableResponse:
                return .none
            }
        }
        .ifLet(\.$presentation, action: /Action.presentation) {
            ElementCategoryStore()
        }
    }
}
