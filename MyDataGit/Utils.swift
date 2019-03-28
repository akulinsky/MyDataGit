//
//  Utils.swift
//  MiniTrack
//
//  Created by Andrey Kulinskiy on 2/19/19.
//  Copyright © 2019 Pointer. All rights reserved.
//

import UIKit

public func delay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

class Utils {
    class func stringFromClass(_ anyClass: AnyClass) -> String {
        let classString = NSStringFromClass(anyClass)
        let classArray:Array<String> = classString.components(separatedBy: ".")
        let className = classArray.last!
        return className
    }
    
    class func sizeWithLabel(_ label: UILabel?) -> CGSize {
        if let label = label, let text = label.text as NSString?, let font = label.font {
            return text.size(withAttributes: [NSAttributedString.Key.font: font])
        }
        else {
            return CGSize(width: 0, height: 0)
        }
    }
}

