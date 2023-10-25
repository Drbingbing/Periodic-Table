//
//  ElementCategoryClient.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/23.
//

import Foundation
import Dependencies

struct ElementCategoryClient {
    
    var allCategories: () async throws -> [ElementCategory]
}

extension ElementCategoryClient: DependencyKey {
    
    static var liveValue: ElementCategoryClient = ElementCategoryClient(
        allCategories: {
            let path = Bundle.main.path(forResource: "periodic_table_categories", ofType: "json")!
            let url = URL(filePath: path)
            let data = try! Data(contentsOf: url)
            return try! JSONDecoder().decode([String: [ElementCategory]].self, from: data)["categories"]!
        }
    )
}

extension DependencyValues {
    
    var categoryClient: ElementCategoryClient {
        get { self[ElementCategoryClient.self] }
        set { self[ElementCategoryClient.self] = newValue }
    }
}
