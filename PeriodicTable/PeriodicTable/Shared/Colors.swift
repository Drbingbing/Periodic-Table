//
//  Colors.swift
//  PeriodicTable
//
//  Created by 鍾秉辰 on 2023/10/16.
//

import UIKit
import Hue

extension UIColor {
    
    static var primaryLabel: UIColor {
        let light = UIColor(hex: "F7EBE8")
        let dark = UIColor(hex: "1E1E24")
        return UIColor(light: dark, dark: light)
    }
    
    static var primaryBackground: UIColor {
        let light = UIColor(hex: "F4F3EE")
        let dark = UIColor(hex: "463F3A")
        return UIColor(light: light, dark: dark)
    }
    
    static var elementGreen: UIColor {
        return UIColor(hex: "C1FF9B")
    }
    
    static var elementPink: UIColor {
        return UIColor(hex: "F9DAD0")
    }
    
    static var elementPurple: UIColor {
        return UIColor(hex: "E0AAFF")
    }
    
    static var elementYellow: UIColor {
        return UIColor(hex: "F5F2B8")
    }
    
    static var elementGray: UIColor {
        return UIColor(hex: "ADB5BD")
    }
    
    static var elementBlue: UIColor {
        return UIColor(hex: "C0F5FA")
    }
    
    static var elementRed: UIColor {
        return UIColor(hex: "FF5A5F")
    }
    
    static var elementBrown: UIColor {
        return UIColor(hex: "ADC178")
    }
    
    static var elementPinkRed: UIColor {
        return UIColor(hex: "EC91D8")
    }
    
    static var elementUnknown: UIColor {
        return UIColor(hex: "E5E5E5")
    }
}
