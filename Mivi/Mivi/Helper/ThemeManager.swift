//
//  ThemeManager.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar on 06/09/2017.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit

enum AppColor {

    case titleLabel
    case valueLabel

    static func color(_ appColor: AppColor?) -> UIColor {
        
        var instanceColor: UIColor = .white
        
        if let appColor = appColor {
            
            switch appColor {
                
            case .titleLabel:
                instanceColor = .darkGray
                
            case .valueLabel:
                instanceColor = .black
                
            }
            return instanceColor
        }
        return instanceColor
    }
}

enum AppFontSize {
    
    case very_tiny
    case tiny
    case small
    case smaller
    case medium
    case large
    case extra_large
    case very_large
}

enum AppFontType {
    
    case light
    case regular
    case italic
    case medium
    case bold
}

class ThemeManager: NSObject {
    
    static func setThemeFont(fontType: AppFontType?, fontSize: AppFontSize?) -> UIFont {
        
        var instanceFont = UIFont.systemFont(ofSize: 14)
        if let fontType = fontType, let fontSize = fontSize {
            instanceFont = UIFont(name: ThemeManager.getFontType(fontType: fontType), size: ThemeManager.getFontSize(fontSize: fontSize))!
        }
        return instanceFont
    }
    
    static func getFontType(fontType:AppFontType) -> String{
        
        /*
 
 
         ------------------------------
         Font Family Name = [Helvetica Neue]
         Font Names = [["HelveticaNeue-UltraLightItalic", "HelveticaNeue-Medium", "HelveticaNeue-MediumItalic", "HelveticaNeue-UltraLight", "HelveticaNeue-Italic", "HelveticaNeue-Light", "HelveticaNeue-ThinItalic", "HelveticaNeue-LightItalic", "HelveticaNeue-Bold", "HelveticaNeue-Thin", "HelveticaNeue-CondensedBlack", "HelveticaNeue", "HelveticaNeue-CondensedBold", "HelveticaNeue-BoldItalic"]]
         ------------------------------
 
        */
        
        
        switch fontType {
            
            case .italic:
                return  "HelveticaNeue-LightItalic"
            
            case .light:
                return  "HelveticaNeue-Light"
            
            case .regular:
                return  "Helvetica Neue"
            
            case .medium:
                return  "HelveticaNeue-Medium"
            
            case .bold:
                return  "HelveticaNeue-Bold"
        }
    }
    
    static func getFontSize(fontSize: AppFontSize) -> CGFloat {
        
        switch fontSize {
            
            case .very_tiny:
                    return  9.0
            
            case .tiny:
                return  11.0
            
            case .smaller:
                return  12.0

            case .small:
                return  13.0
            
            case .medium:
                return  14.0
            
            case .large:
                return  16.0
            
            case .extra_large:
                return  24.0
            
           case .very_large:
                return  28.0
        }
    }
}
