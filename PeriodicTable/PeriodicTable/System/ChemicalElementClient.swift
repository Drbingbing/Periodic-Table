//
//  ChemicalElementClient.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/20.
//

import Foundation
import ComposableArchitecture

struct ChemicalElementClient {
    
    var discoveredElements: () async throws -> [ChemicalElement]
}

extension ChemicalElementClient: DependencyKey {
    
    static var liveValue: ChemicalElementClient = ChemicalElementClient(
        discoveredElements: {
            let path = Bundle.main.path(forResource: "periodic_table", ofType: "json")!
            let url = URL(filePath: path)
            let data = try! Data(contentsOf: url)
            let decoded = try! JSONDecoder().decode(ChemicalElementResults.self, from: data)
            return decoded.result
        }
    )
}

extension ChemicalElementClient: TestDependencyKey {
    
    static var previewValue: ChemicalElementClient = ChemicalElementClient(
        discoveredElements: {
            let path = Bundle.main.path(forResource: "periodic_table", ofType: "json")!
            let url = URL(filePath: path)
            let data = try! Data(contentsOf: url)
            let decoded = try! JSONDecoder().decode(ChemicalElementResults.self, from: data)
            return decoded.result
        }
    )
}

extension DependencyValues {
    
    var chemicalClient: ChemicalElementClient {
        get { self[ChemicalElementClient.self] }
        set { self[ChemicalElementClient.self] = newValue }
    }
}
