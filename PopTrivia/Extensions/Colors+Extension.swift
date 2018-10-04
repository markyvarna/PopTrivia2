//
//  Colors+Extension.swift
//  PopTrivia
//
//  Created by Markus Varner on 10/4/18.
//  Copyright © 2018 CreakyDoor. All rights reserved.
//

import UIKit

extension UIColor {
    
    public var hexValue: Int {
        
        var rF: CGFloat = 0
        var gF: CGFloat = 0
        var bF: CGFloat = 0
        getRed(&rF, green: &gF, blue: &bF, alpha: nil)
        let r = Int(rF*255)
        let g = Int(gF*255)
        let b = Int(bF*255)
        return r << 16 + g << 8 + b
    }
    
    public convenience init(hex value: Int, alpha: CGFloat = 1) {
        let r = (value & 0xFF0000) >> 16
        let g = (value & 0x00FF00) >> 8
        let b = value & 0x0000FF
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: alpha)
    }
}

 struct MVColors {
    static func sealBlue() -> UIColor {
        return UIColor(hex: 0x19B2E1)
    }
    
    static func snowWhite() -> UIColor {
        return UIColor(hex: 0xF5F9FC)
    }
    
    static func sealBlueDark() -> UIColor {
        return UIColor(hex: 0x006BC2)
    }
    
    static func sealBlueLight() -> UIColor {
        return UIColor(hex: 0x7FF3F3)
    }
    
    
}
