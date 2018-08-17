//
//  UILabel+Additions.swift
//  Mivi
//
//  Created by Talentedge on 17/08/18.
//  Copyright © 2018 Sample. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    func setFont(size:  AppFontSize, type: AppFontType, color: AppColor) {
        self.font = ThemeManager.setThemeFont(fontType: type, fontSize: size)
        self.textColor = AppColor.color( color)
    }
}
