//
//  UIFont+MB.swift
//  structureCoversionDemo
//
//  Created by Mobikasa on 29/09/17.
//  Copyright © 2017 mobikasa. All rights reserved.
//

import Foundation
extension UIFont{
    enum fontType: Int {
        case Regular = 0
        case Bold
        case Italic
        case SemiBold
        case Light
        case Medium
    }
    
    
    
//    typedef enum : NSUInteger {
//    Regular,
//    Bold,
//    Italic,
//    SemiBold,
//    Light,
//    Medium,
//    } fontType
    
    class func ed_AppFont(with type: fontType, withSize size: Float) -> UIFont {
        var string: String =  AppConstants.K_THEME_FONT_REGULAR
        switch type {
        case fontType.Light:
            string = AppConstants.K_THEME_FONT_REGULAR
        case fontType.SemiBold:
            string = AppConstants.K_THEME_FONT_SEMIBOLD
        case fontType.Bold:
            string = AppConstants.K_THEME_FONT_BOLD
        default:
            break
        }
        return UIFont(name: string, size: CGFloat(size))!
    }
}
