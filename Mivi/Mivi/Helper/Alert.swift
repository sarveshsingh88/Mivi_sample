//
//  Alert.swift
//  Bconnected
//


import Foundation
import UIKit

class Alert {
    
    // MARK: Alert methods
    
    class func showAlertWithAction(title: String?, message: String?, style: UIAlertControllerStyle, actionTitles:[String?], action:((UIAlertAction) -> Void)?) {
        
        showAlertWithActionWithCancel(title: title, message: message, style: style, actionTitles: actionTitles, showCancel: false, deleteTitle: nil, action: action)
    }
    
    class func showAlertWithActionWithCancel(title: String?, message: String?, style: UIAlertControllerStyle, actionTitles:[String?], showCancel:Bool, deleteTitle: String? ,_ viewC: UIViewController? = nil, action:((UIAlertAction) -> Void)?) {
        
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        if deleteTitle != nil {
            let deleteAction = UIAlertAction(title: deleteTitle, style: .destructive, handler: action)
            alertController.addAction(deleteAction)
        }
        for (_, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: action)
            alertController.addAction(action)
        }
        
        if showCancel {
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
        }
        if let viewController = viewC {
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    
}

