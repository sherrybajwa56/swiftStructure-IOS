//
//  NSString+SB.swift
//  structureCoversionDemo
//
//  Created by Mobikasa on 07/09/17.
//  Copyright © 2017 mobikasa. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
extension String {
    
    func splitWith(_ character: String, atIndex index: Int) -> String {
        var array: [String] = self.components(separatedBy: character)
        
       // return (array.MB_safeObjectAtIndex(index)) ?? ""
        return array[index]
    }
    
    func base64ToImage() -> UIImage {
        let data: Data = Data.init(base64Encoded: self, options: Data.Base64DecodingOptions(rawValue: 0))!//Data(base64encodedstring: self, options: 0)
        
      //  CGRect st
        return UIImage(data: data as Data)!
        
    }
    
    func frombase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }

    func tobase64() -> String {
        
             return Data(self.utf8).base64EncodedString()
        
    }
    
    func hasSpace() -> Bool {
        let array: [String] = self.components(separatedBy: " ")
        return array.count > 1
    }
    
    func range() -> NSRange {
        
        return NSMakeRange(0, self.characters.count)
        
    }
    
    func getDateStringWithFormat(_ dateFormat: String?) -> String {
        
        let dateformatter: DateFormatter = DateFormatter()
        let date: NSDate = self.getDateObjectFromString()
        dateformatter.timeZone = NSTimeZone.default
        dateformatter.dateFormat = dateFormat ?? AppConstants.K_DATE_MMDDYY
        return dateformatter.string(from: date as Date)
    }
    
    func getDateWithFormat(_ dateFormat: String?) -> NSDate {
        
        let dateformatter: DateFormatter = DateFormatter()
        let date: NSDate = self.getDateObjectFromString()
        dateformatter.timeZone = NSTimeZone.default
        dateformatter.dateFormat = dateFormat ?? AppConstants.K_DATE_MMDDYY
        return date
        
    }
    
    func getDateObjectFromString() -> NSDate {
        
        let dateformatter: DateFormatter = DateFormatter()
        dateformatter.timeZone = NSTimeZone(abbreviation: "EST")! as TimeZone
        dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateformatter.date(from: self)! as NSDate
        
    }
   

}
