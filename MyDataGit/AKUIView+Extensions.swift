//
//  AKUIView+Extensions.swift
//  MiniTrack
//
//  Created by Andrey Kulinskiy on 2/19/19.
//  Copyright © 2019 Pointer. All rights reserved.
//

import UIKit

extension UIView {
    // MARK: - Init
    class func newWithHeight(_ height: Float) -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.snpHeight(height)
        return view
    }
    
    class func newWithWidth(_ width: Float) -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        view.snpWidth(width)
        return view
    }
    
    // MARK: - Rect
    var ak_edgeX: CGFloat {
        get {
            return self.ak_x + self.ak_width
        }
    }
    
    var ak_edgeY: CGFloat {
        get {
            return self.ak_y + self.ak_height
        }
    }
    
    var ak_x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    var ak_y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    var ak_width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    var ak_height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    // MARK: - Constraints
    func snpHeight(_ height: Float) {
        self.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
    }
    
    func snpWidth(_ width: Float) {
        self.widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
    }
    
    // MARK: - Subviews
    func removeSubviewWith(tag: Int) {
        if let view = self.viewWithTag(tag) {
            view.removeFromSuperview()
        }
    }
    
    func findSubviewsOf(anyClass: AnyClass) -> [UIView] {
        var array = [UIView]()
        
        for view in self.subviews {
            if view.isKind(of: anyClass) {
                array.append(view)
            }
        }
        return array
    }
    
    func viewController() -> UIViewController? {
        
        var view = self.superview
        var viewController: UIViewController?
        repeat {
            if let view = view?.superview,
                let responder = view.next,
                let controller = responder as? UIViewController {
                viewController = controller
                break
            }
            view = view?.superview
        } while view != nil
        
        return viewController
    }
    
    func viewFirstResponder() -> UIView? {
        
        if self.isFirstResponder {
            return self
        }
        
        for subview in self.subviews {
            if let firstResponder = subview.viewFirstResponder() {
                return firstResponder
            }
        }
        
        return nil
    }
    
    func snapshot() -> UIImage? {
        
        UIGraphicsBeginImageContext(self.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        self.layer.render(in:context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    // MARK: - Misk
    func markRed() {
        self.backgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.3)
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 1.0
    }
    
    func markGreen() {
        self.backgroundColor = UIColor(red: 0, green: 1.0, blue: 0, alpha: 0.3)
        self.layer.borderColor = UIColor.green.cgColor
        self.layer.borderWidth = 1.0
    }
    
    func markBlue() {
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 1.0, alpha: 0.3)
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.borderWidth = 1.0
    }
    
    func markRandom() {
        
        let red = CGFloat(arc4random_uniform(UInt32(254))) / 255.0
        let green = CGFloat(arc4random_uniform(UInt32(254))) / 255.0
        let blue = CGFloat(arc4random_uniform(UInt32(254))) / 255.0
        
        self.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 0.3)
        self.layer.borderColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0).cgColor
        self.layer.borderWidth = 1.0
    }
}
