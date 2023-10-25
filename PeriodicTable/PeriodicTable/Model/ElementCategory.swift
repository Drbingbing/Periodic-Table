//
//  ElementCategory.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/20.
//

import Foundation

//enum ElementCategory: String, Codable {
//    case alkalineEearthMetal = "鹼土金屬"
//    case alkaliMetal = "鹼金屬"
//    case lanthanide = "鑭系元素"
//    case actinide = "錒系元素"
//    case transitionMetal = "過渡金屬"
//    case postTransitionMetal = "貧金屬"
//    case nonmetal = "非金屬"
//    case nobleGas = "惰性氣體"
//    case metalloid = "類金屬"
//    case halogen = "鹵素"
//    case unknown = "未知"
//}

struct ElementCategory: Codable {
    
    var key: String
    var name: String
    
    
}
