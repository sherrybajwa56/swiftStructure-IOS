//
//  AppConstants.swift
//  structureCoversionDemo
//
//  Created by Mobikasa on 07/09/17.
//  Copyright © 2017 mobikasa. All rights reserved.
//

import Foundation
import UIKit
import ReachabilitySwift
import PKHUD

struct AppConstants {
 
    static var K_USERPASS: String = "password"
    static var K_ACCESSTOKEN: String = "AccessToken"
    static var K_USERNAME: String = "username"
    static var K_GUIDELABEL: String = "GuideLabel"
    static var K_SESSIONTOKEN: String = "X-User-Token"
    static var K_MASTERDATA_CHECKSUM: String = "masterData_Checksum"
    static var K_USERID: String = "USERID"
    static var K_DEVICE_TOKEN: String = "device_token"
    static var K_DEVICE_ID: String = "device_id"
    static var K_BADGE_COUNT: String = "badgeCount"
    
     // Date Format
    static var K_DATE_MMDDYY: String = "MM/dd/yy"
    static var K_DATE_MMDDYYYY: String = "MM/dd/yyyy"
    static var K_DATE_WITHTIME: String = "yyyy-MM-dd HH:mm:ss"
    
    //font name
    
    static let K_THEME_FONT_REGULAR = "helvetica"
    static let K_THEME_FONT_BOLD = "helvetica-bold"
    static let K_THEME_FONT_SEMIBOLD = "helvetica-semibold"
    

    let APP_NAME = Bundle.main.object(forInfoDictionaryKey: "MBBundleName")
    
    static func isReachableToInternet() -> Bool{
     
        return  (Reachability()?.isReachable)!
        
    }
    
    static func resetDefaults() {
        
        UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    }
    
    func SAVE_USER_DEFAULTS(value: Any, key: String) {
        
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    func GET_USER_DEFAULTS(KEY: String) -> Any {
        
        return UserDefaults.standard.object(forKey: KEY) ?? ""
        
    }
    func REMOVE_USER_DEFAULTSFOR(KEY: String) {
        
         UserDefaults.standard.removeObject(forKey: KEY)
    }
    
     static let SCREEN_SIZE : CGSize = {
        
            return UIScreen.main.bounds.size
    }()
    
     static func HIDE_NETWORK_PROGRESS() {
    
       if isReachableToInternet(){
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false

       }
    }
    static let APP_DELEGATE : AppDelegate = {
        
        return AppDelegate.sharedInstance
    }()
    
    static let APP_WINDOW : UIWindow? = {
        
        return AppConstants.APP_DELEGATE.window
    }()
    
    static let IS_NETWORK_REACHABLE : Bool = {
        
        return isReachableToInternet()
    }()

    static func SHOW_NETWORK_PROGRESS() {
        
        if isReachableToInternet(){
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
         
         }
     }
    
    static func SHOW_PROGRESS(onView view: UIView? = nil) {
        
        if isReachableToInternet(){
           
           // PKHUD.sharedHUD.show(onView:view)
        }
    }
    
    static func getUniqueIdentifier() -> NSString {
        
        return UIDevice.current.identifierForVendor!.uuidString as NSString
        
    }
    
}

//#define SHOW_NETWORK_PROGRESS (IS_NETWORK_REACHABLE) ? [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES] : nil
//#define HIDE_NETWORK_PROGRESS [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO]
//

//
//#define SHOW_PROGRESS (IS_NETWORK_REACHABLE) ? [SVProgressHUD showWithStatus:@"Please wait." maskType:SVProgressHUDMaskTypeBlack] : nil ;[APP_DELEGATE window].userInteractionEnabled = FALSE
//#define SHOW_PROGRESS_MASK [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient]
//#define SHOW_PROGRESSWITHMSG(text) (IS_NETWORK_REACHABLE) ? [SVProgressHUD showWithStatus:text maskType:SVProgressHUDMaskTypeGradient] : nil ;[APP_DELEGATE window].userInteractionEnabled = FALSE
//
//#define HIDE_PROGRESS [SVProgressHUD dismiss];[APP_DELEGATE window].userInteractionEnabled = TRUE
//#define SHOW_ERROR(msg) [SVProgressHUD showErrorWithStatus:msg maskType:SVProgressHUDMaskTypeGradient]
//#define SHOW_SUCESS(msg) [SVProgressHUD showSuccessWithStatus:msg]
//
//
//#define GETCONTROLLER(v) [self.storyboard instantiateViewControllerWithIdentifier:v]
//#define PUSH(v) [self.navigationController pushViewController:v animated:YES]
//#define POPBACK  [self.navigationController popViewControllerAnimated:YES]
//#define POPTOROOT  [self.navigationController popToRootViewControllerAnimated:YES]
//#define PUSHCONTROLLER(v) [self.navigationController pushViewController:GETCONTROLLER(v) animated:YES]
//
//#define PRESENT(v) [self presentViewController:v animated:YES completion:nil]
//#define DISMISSCONTROLLER [self dismissViewControllerAnimated:YES completion:nil]
//
//
//#define WIDTH self.view.frame.size.width
//#define HEIGHT self.view.frame.size.height
//
//#define WWIDTH [[AppDelegate sharedDelegate] window].bounds.size.width
//#define WHEIGHT [[AppDelegate sharedDelegate] window].bounds.size.height
//
//
//#define UNIQUE_IDENTIFIER [[[UIDevice currentDevice] identifierForVendor] UUIDString]
//
//#define ENDEDITING [self.view.window endEditing:YES]
//
//#define BUTTON_ACTION(v,w) 


