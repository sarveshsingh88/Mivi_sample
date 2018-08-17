//
//  UITableView+BZAdditions.swift
//  Bconnected
//
//  Created by TechAhead on 29/06/17.
//  Copyright © 2017 TechAhead Software. All rights reserved.
//

import UIKit

extension UITableView {
    
    
    // Register nib on UITableView...
    func register(nib nibName:String) {
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forCellReuseIdentifier: nibName)
    }
    
    // Register multiple nib at once
    func registerMultiple(nibs arrayNibs:[String]) {
        for nibName in arrayNibs {
            register(nib: nibName)
        }
    }
    
    func setTableHeaderView(_ header: UIView, height:CGFloat) {
        
        self.tableHeaderView = header
        header.setNeedsLayout()
        header.layoutIfNeeded()
        self.tableHeaderView = header
        self.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: height)
    }
    
    func setTableFooterView(_ footer: UIView, height:CGFloat) {
        
        self.tableFooterView = footer
        footer.setNeedsLayout()
        footer.layoutIfNeeded()
        self.tableFooterView = footer
        self.tableFooterView?.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: height)
    }
    
    // Register nib for Header Footer on UITableView...
    func registerHeaderFooter(nib nibName:String) {
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forHeaderFooterViewReuseIdentifier: nibName)
    }

    func hideEmptyCells() {
        let view = UIView()
        view.backgroundColor = .clear
        view.frame = .zero
        self.tableFooterView = view
    }
    
    func scrollToTop(animation: Bool) {

        if self.tableHeaderView != nil {
            self.setContentOffset(.zero, animated: animation)
            //self.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: animation)
        } else {
            let indexPath = IndexPath(row: 0, section: 0)
            self.scrollToRow(at: indexPath, at: .top, animated: animation)
        }
    }
    
    func scrollToBottom(animation: Bool) {
        
        let section = self.numberOfSections - 1
        let lastRow = self.numberOfRows(inSection: section) - 1
        if section >= 0, lastRow >= 0 {
            let indexPath = IndexPath(row: lastRow, section: section)
            self.scrollToRow(at: indexPath, at: .bottom, animated: animation)
        }
    }
    
    func displayNoContent(message: String? = "Functionality not implemented yet") { // FIXME: Need to remove hardcoded default message while sending for UAT or production
        if let label = self.viewWithTag(55) as? UILabel {
            label.text = message
            return
        }
        
        let messageLabel = UILabel(frame: CGRect(x: 20, y: self.bounds.origin.y, width: self.bounds.size.width - 40, height: self.bounds.size.height))
        messageLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleTopMargin, .flexibleBottomMargin, .flexibleLeftMargin, .flexibleRightMargin]
        messageLabel.translatesAutoresizingMaskIntoConstraints = true
        messageLabel.text = message
//        messageLabel.font = UIFont.fontForSFLight(size: .size_22)
        messageLabel.textAlignment = .center
        messageLabel.textColor = UIColor(white: 0.25, alpha: 0.35)
        messageLabel.numberOfLines = 0
        messageLabel.tag = 55
        messageLabel.bringSubview(toFront: self)
        self.addSubview(messageLabel)
    }
    
    func removeNoContent() {
        if let label = self.viewWithTag(55) as? UILabel {
            label.removeFromSuperview()
        }
    }
    
    func showHideEmptyStateView(_ title: String? = "", description: String? = nil, subDescription: String? = nil, iconImage: UIImage? = nil) {
        
        if self.numberOfRows(inSection: 0) == 0 {
            
//            if let emptyStateView = self.viewWithTag(5555) as? BZEmptyStateView {
//                emptyStateView.lblTitle.text = title
//                return
//            }
//            
//            let emptyStateView = UIView.loadFromNibNamed("BZEmptyStateView") as! BZEmptyStateView?
//            emptyStateView?.tag = 5555
//            emptyStateView?.lblTitle.text = title
//            emptyStateView?.imgView.isHidden = true
//            emptyStateView?.lblDescription.isHidden = true
//            emptyStateView?.lblSubdescription.isHidden = true
//            emptyStateView?.frame =  self.frame
//            emptyStateView?.frame.origin.y = 0
//            self.addSubview(emptyStateView!)
        } else {
            if let emptyStateView = self.viewWithTag(5555) {
                emptyStateView.removeFromSuperview()
            }
        }
    }
    
    // Reload with completion
    func reloadData(_ completion: @escaping () -> ()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() }, completion: { _ in completion() })
    }
    
    // Scroll to bottom
    func scrollToBottom(_ animated: Bool = true) {
        let section = self.numberOfSections
        if section > 0 {
            let row = self.numberOfRows(inSection: section - 1)
            if row > 0 {
                self.scrollToRow(at: IndexPath(row: row - 1, section: section - 1), at: .bottom, animated: animated)
            }
        }
    }
}


extension UITableView {
    
    func register<T:UITableViewCell>(_: T.Type) where T: ReusableView {
        self.register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T:UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        self.register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T:UITableViewCell>() -> T where T: ReusableView {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return cell
    }
    
    func dequeueReusableCell<T:UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return cell
    }
}

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: Self.self)
    }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: Self.self)
    }
}

extension UITableView {
    
    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }

}
