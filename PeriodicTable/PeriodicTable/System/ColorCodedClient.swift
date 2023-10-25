//
//  ColorCodedClient.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/20.
//

import Foundation
import ComposableArchitecture

struct ColorCodedClient {
    
    fileprivate static var table: [ColorCoded] = []
    
    var colorTable: () async throws -> [ColorCoded]
    var hex: (String) -> String
}

extension ColorCodedClient: DependencyKey {
    
    static var liveValue: ColorCodedClient = ColorCodedClient(
        colorTable: {
            let path = Bundle.main.path(forResource: "color_coded", ofType: "json")!
            let url = URL(filePath: path)
            let data = try! Data(contentsOf: url)
            ColorCodedClient.table = try! JSONDecoder().decode([String: [ColorCoded]].self, from: data)["colors"]!
            return ColorCodedClient.table
        },
        hex: { key in
            let hex = ColorCodedClient.table.first(where: { $0.key == key })?.hex
            return hex ?? "E8E8E8"
        }
    )
}

extension DependencyValues {
    
    var colorCoded: ColorCodedClient {
        get { self[ColorCodedClient.self] }
        set { self[ColorCodedClient.self] = newValue }
    }
}
