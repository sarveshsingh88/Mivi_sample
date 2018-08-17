//
//  UIView+Additions.swift
//
//

import Foundation
import UIKit

extension UIView {
    
    // Set corner radius, border width and border color of a view
    func cornerRadiusAndBorder(radius: CGFloat, borderWidth: CGFloat, borderColor: UIColor, clip: Bool = true) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.clipsToBounds = clip
        self.layer.masksToBounds = clip
    }
    
    func addBottomLine() {
        
        
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    // Make circlar view
    func makeCircle() {
        let width = self.frame.size.width
        self.layer.cornerRadius = width/2.0
        self.clipsToBounds = true
    }
    // instantiation of Nib for Header, Footer etc.
    class func fromNib<T>(_ nibName: String, type: T.Type) -> T? {
        return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)!.first as? T
        //return nil
    }

    class func fromNib<T: UIView>(viewType: T.Type) -> T? {
        if let url = URL(string: NSStringFromClass(viewType)) {
            return Bundle.main.loadNibNamed(url.pathExtension, owner: self, options: nil)!.first as? T
        }
        return nil
    }
    
    // load view from nib name
    class func loadFromNibNamed(_ nibNamed: String, bundle : Bundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
    func initializeFromNib(nibNamed: String) {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibNamed, bundle: bundle)
        if let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView {
            view.frame = bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubview(view)
        }
    }

    
    func parentView<T: UIView>(of type: T.Type) -> T? {
        guard let view = self.superview else {
            return nil
        }
        return (view as? T) ?? view.parentView(of: T.self)
    }
    
//    func roundCorner(roundingCorners: UIRectCorner, cornerRadius: CGFloat) {
//        let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
//        let maskLayer = CAShapeLayer()
//        maskLayer.path = path.cgPath
//        layer.mask = maskLayer
//    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }

    func fadeIn(_ duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(_ duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
    
    func addShadow(color: UIColor, opacity: CGFloat = 1.0, radius: CGFloat = 5) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = Float(opacity)
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = radius
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
}

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}

