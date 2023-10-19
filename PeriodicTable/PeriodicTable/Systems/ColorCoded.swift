//
//  ColorCoded.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/17.
//

import Foundation

final class ColorCoded {
    
    func hex(for element: ChemicalElement?) -> String {
        guard let element else { return "F4F3EE"}
        switch element.category {
        case .alkalineEearthMetal:
            return "F5F2B8"
        case .alkaliMetal:
            return "FF5A5F"
        case .lanthanide:
            return "E0AAFF"
        case .actinide:
            return "EC91D8"
        case .transitionMetal:
            return "F9DAD0"
        case .postTransitionMetal:
            return "ADB5BD"
        case .nonmetal:
            return "C1FF9B"
        case .nobleGas:
            return "C0F5FA"
        case .metalloid:
            return "ADC178"
        case .halogen:
            return "FFF75E"
        case .unknown:
            return "E5E5E5"
        }
    }
}
