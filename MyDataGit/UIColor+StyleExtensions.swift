//
//  UIColor+Extensions.swift
//  MiniTrack
//
//  Created by Sergiy Kostrykin on 2/19/19.
//  Copyright © 2019 Pointer. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var baseViewBackgroundColor: UIColor {
        return UIColor(hex: "050d25")!
    }
    
    static var redColor: UIColor {
        return UIColor(in8bit: 241, 77, 59)
    }
    
    static var yellowColor: UIColor {
        return UIColor(in8bit: 255, 238, 189)
    }
    
    static var greenColor: UIColor {
        return UIColor(in8bit: 144, 199, 98)
    }
    
    static var blackColor: UIColor {
        return UIColor(in8bit: 4, 4, 4)
    }
    
    static var blueColor: UIColor {
        return UIColor(in8bit: 29, 118, 234)
    }
    
    static var grayColor: UIColor {
        return UIColor(in8bit: 128, 130, 133)
    }
    
    static var lightGrayColor: UIColor {
        return UIColor(in8bit: 203, 203, 203)
    }
    
    static var lightGrayAlpha: UIColor {
        return UIColor(in8bit: 203, 203, 203, alpha: 0.2)
    }
    
    static var lineColor: UIColor {
        return UIColor(in8bit: 203, 203, 203)
    }
    
    convenience init?(hex: String) {
        guard let rgbValue = UInt(hex, radix: 16) else {return nil}
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16)/255.0, green: CGFloat((rgbValue & 0xFF00) >> 8)/255.0, blue: CGFloat(rgbValue & 0xFF)/255.0, alpha: 1)
    }
    
    convenience init(in8bit red: UInt8, _ green: UInt8, _ blue: UInt8, alpha: CGFloat = 1) {
        let div: CGFloat = 255
        self.init(red: CGFloat(red)/div,
                  green: CGFloat(green)/div,
                  blue: CGFloat(blue)/div,
                  alpha: alpha)
    }
    
    var rgb: (red:Int, green:Int, blue:Int, alpha:Float)? {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
            let iBlue = Int(fBlue * 255.0)
            let iAlpha = Float(fAlpha)
            
            return (red:iRed, green:iGreen, blue:iBlue, alpha:iAlpha)
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }
}
