//
//  PeriodicTableGenerator.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/16.
//

import Foundation
import IGListKit

@objc
protocol PeriodicTableUseCaseListener: AnyObject {
    func didUpdate(announcer: PeriodicTableUseCase)
}

final class PeriodicTableUseCase: NSObject {
    
    private let map = NSHashTable<PeriodicTableUseCaseListener>.weakObjects()
    private let colorCoded = ColorCoded()
    
    let table: PeriodicTable
    
    var objects: [ChemicalElement] { table.elements }
    
    private(set) var elements: [ListDiffable] = []
    
    override init() {
        let path = Bundle.main.path(forResource: "periodictable", ofType: "json")!
        let url = URL(filePath: path)
        let data = try! Data(contentsOf: url)
        table = try! JSONDecoder().decode(PeriodicTable.self, from: data)
        super.init()
    }
    
    func addListener(_ listener: PeriodicTableUseCaseListener) {
        map.add(listener)
    }
    
    func periodicTable() -> [ListDiffable] {
        
        var result: [ListDiffable] = []
        
        for object in objects.filter ({ $0.category != .lanthanide && $0.category != .actinide }) {
            
            result.append(
                ChemicalElementViewModel(
                    atomicNumber: object.atomicNumber,
                    symbol: object.symbol,
                    name: object.name,
                    hex: colorCoded.hex(for: object)
                )
            )
            
            if object.atomicNumber == 1 {
                result.append(contentsOf: (0..<16).map { _ in PlaceholderViewModel() })
            }
            
            if [4, 12].contains(object.atomicNumber) {
                result.append(contentsOf: (0..<10).map { _ in PlaceholderViewModel() })
            }
            
            if object.atomicNumber == 56 {
                result.append(
                    ChemicalElementViewModel(
                        atomicNumber: nil,
                        symbol: nil,
                        name: "鑭系",
                        hex: "E0AAFF",
                        range: " 57 ~ 71"
                    )
                )
            }
            if object.atomicNumber == 88 {
                result.append(
                    ChemicalElementViewModel(
                        atomicNumber: nil,
                        symbol: nil,
                        name: "錒系",
                        hex: "EC91D8",
                        range: "89 ~ 103"
                    )
                )
            }
        }
        
        return result
    }
    
    func retrieveElements(by sort: PeriodicTableSort) -> [ListDiffable] {
        switch sort {
        case .byTable:
            return ["table"].map { $0 as ListDiffable }
        case .byGroup:
            var result = [[ChemicalElementViewModel]](repeating: [], count: 18)
            
            for object in objects {
                result[object.group - 1].append(
                    ChemicalElementViewModel(
                        atomicNumber: object.atomicNumber,
                        symbol: object.symbol,
                        name: object.name,
                        hex: colorCoded.hex(for: object)
                    )
                )
            }
            
            let viewModels = result.map { PeriodicTableSortViewModel(elements: $0) }
            return viewModels
        case .byPeriod:
            var result = [[ChemicalElementViewModel]](repeating: [], count: 7)
            
            for object in objects {
                result[object.period - 1].append(
                    ChemicalElementViewModel(
                        atomicNumber: object.atomicNumber,
                        symbol: object.symbol,
                        name: object.name,
                        hex: colorCoded.hex(for: object)
                    )
                )
            }
            
            let viewModels = result.map { PeriodicTableSortViewModel(elements: $0) }
            return viewModels
        case .byAtomicNumber:
            let viewModels = objects.map {
                ChemicalElementViewModel(
                    atomicNumber: $0.atomicNumber,
                    symbol: $0.symbol,
                    name: $0.name,
                    hex: colorCoded.hex(for: $0)
                )
            }
            
            return [PeriodicTableSortViewModel(elements: viewModels)]
        }
    }
}
