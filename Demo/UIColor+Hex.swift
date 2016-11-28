//
//  UIColor+Hex.swift
//  Demo
//
//  Created by James Avakian on 11/15/16.
//  Copyright © 2016 Optical Automation, LLC. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    convenience init(hexString str: String, alpha: CGFloat) {
        let range = NSMakeRange(0, str.characters.count)
        let hex = (str as NSString).replacingOccurrences(of: "[^0-9a-fA-F]", with: "", options: .regularExpression, range: range)
        var color: UInt32 = 0
        Scanner(string: hex).scanHexInt32(&color)
        self.init(hex: Int(color), alpha: alpha)
    }
    var hexString: String? {
        return self.cgColor.hexString
    }
    var RGBa: (red: Int, green: Int, blue: Int, alpha: CGFloat)? {
        return self.cgColor.RGBa
    }
}

extension CGColor {
    var hexString: String? {
        if let x = self.RGBa {
            let hex = x.red * 0x10000 + x.green * 0x100 + x.blue
            return NSString(format:"%06x", hex) as String
        } else {
            return nil
        }
    }
    var RGBa: (red: Int, green: Int, blue: Int, alpha: CGFloat)? {
        let colorSpace = self.colorSpace
        switch colorSpace!.model {
        case .monochrome:
            return (0, 0, 0, self.components!.last!)
        case .rgb:
            let x = self.components
            let r: Int = Int(x![0] * 255.0)
            let g: Int = Int(x![1] * 255.0)
            let b: Int = Int(x![2] * 255.0)
            let a: CGFloat = x![3]
            return (r, g, b, a)
        default:
            return nil
        }
    }
}
