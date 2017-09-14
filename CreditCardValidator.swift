//
//  CreditCardValidator.swift
//  structureCoversionDemo
//
//  Created by Mobikasa on 14/09/17.
//  Copyright © 2017 mobikasa. All rights reserved.
//

import Foundation

enum creditCardType : Int {
    case visa = 0
    case MasterCard
    case Amex
    case Discover
    case DinersClub
    case JcbClub
    case InvalidCard
}
let CC_LEN_FOR_TYPE = 4

let VISA = "^4[0-9]{15}?"
let MC = "^5[1-5][0-9]{14}$"
let AMEX_REG = "^3[47][0-9]{13}$"
let DISCOVER = "^6(?:011|5[0-9]{2})[0-9]{12}$"
let DINERS_CLUB = "^3[068][0-9]{2}$"
let JCB_CLUB = "^2[1]?$|^21[3]?$|^1[8]?$|^18[0]?$|^(?:2131|1800)[0-9]{0,11}$|^3[5]?$|^35[0-9]{0,14}$"
let AMEX_REG_TYPE = "^3[47][0-9]{2}$"
let DINERS_CLUB_TYPE = "^3[068][0-9]{2}$"
let VISA_TYPE = "^4[0-9]{3}?"
let MC_TYPE = "^5[1-5][0-9]{2}$"
let DISCOVER_TYPE = "^6(?:011|5[0-9]{2})$"
let JCB_CLUB_TYPE = "^2[1]?$|^21[3]?$|^1[8]?$|^18[0]?$|^(?:2131|1800)[0-9]{0,11}$|^3[5]?$|^35[0-9]{0,14}$"
let kID = "id"
let kCCid = "id"
let kCCnumber = "card_number"
let kCCtype = "card_type"
let kCCexpir = "card_expiration"
let kCCccv = "card_cvv"
let kCCaddrID = "address_id"
let kCCdefault = "default"


private var visaReg: NSRegularExpression?
private var mcReg: NSRegularExpression?
private var amexReg: NSRegularExpression?
private var discoverReg: NSRegularExpression?
private var dinersClubReg: NSRegularExpression?
private var jcbClubReg: NSRegularExpression?
private var visaTypeReg: NSRegularExpression?
private var mcTypeReg: NSRegularExpression?
private var amexTypeReg: NSRegularExpression?
private var discoverTypeReg: NSRegularExpression?
private var dinersClubTypeReg: NSRegularExpression?
private var jcbClubTypeReg: NSRegularExpression?


open class CreditCardValidator{
    
    private var privateDict = [AnyHashable: Any]()
    
    class func initialize() {
        if self == CreditCardValidator.self {
            
            visaReg = try? NSRegularExpression(pattern: VISA, options: [])
            mcReg = try? NSRegularExpression(pattern: MC, options: [])
            amexReg = try? NSRegularExpression(pattern: AMEX_REG, options: [])
            discoverReg = try? NSRegularExpression(pattern: DISCOVER, options: [])
            dinersClubReg = try? NSRegularExpression(pattern: DINERS_CLUB, options: [])
            jcbClubReg = try? NSRegularExpression(pattern: JCB_CLUB, options: [])
            visaTypeReg = try? NSRegularExpression(pattern: VISA_TYPE, options: [])
            mcTypeReg = try? NSRegularExpression(pattern: MC_TYPE, options: [])
            amexTypeReg = try? NSRegularExpression(pattern: AMEX_REG_TYPE, options: [])
            discoverTypeReg = try? NSRegularExpression(pattern: DISCOVER_TYPE, options: [])
            dinersClubTypeReg = try? NSRegularExpression(pattern: DINERS_CLUB_TYPE, options: [])
            jcbClubTypeReg = try? NSRegularExpression(pattern: JCB_CLUB_TYPE, options: [])
        }
    }
            
    class func cleanNumber(_ str: String) -> String {
        return str.replacingOccurrences(of: " ", with: "")
    }
    
    // http://www.regular-expressions.info/creditcard.html
    
    class func ccType(proposedNumber: String) -> creditCardType {
        var reg: NSRegularExpression?
        if proposedNumber.characters.count  < CC_LEN_FOR_TYPE {
            return .InvalidCard
        }
        
      //  let types : creditCardType = idx
        
        for idx in 0..<6 {
            switch idx {
            case creditCardType.visa.rawValue:
                reg = visaTypeReg
                break
            case creditCardType.MasterCard.rawValue:
                reg = mcTypeReg
                break
            case creditCardType.Amex.rawValue:
                reg = amexTypeReg
                break
            case creditCardType.Discover.rawValue:
                reg = discoverTypeReg
                break
            case creditCardType.DinersClub.rawValue:
                reg = dinersClubTypeReg
                break
            case creditCardType.JcbClub.rawValue:
                reg = jcbClubTypeReg
                break
            default : break
                
            }
        
            
            let matches: Int? = reg?.numberOfMatches(in: proposedNumber, options: [], range: NSRange(location: 0, length: CC_LEN_FOR_TYPE))
            if matches == 1 {
                return creditCardType(rawValue: idx)!
         }
     }
    
        return .InvalidCard
    }
    
    class func isValidNumber(_ number: String) -> Bool {
        var reg: NSRegularExpression?
        var ret: Bool = false
        let value : Int = ccType(proposedNumber: number).rawValue
        
        switch value {
        case creditCardType.visa.rawValue:
            reg = visaReg
        case creditCardType.MasterCard.rawValue:
            reg = mcReg
        case creditCardType.Amex.rawValue:
            reg = amexReg
        case creditCardType.Discover.rawValue:
            reg = discoverReg
        case creditCardType.DinersClub.rawValue :
            reg = dinersClubReg
        case creditCardType.JcbClub.rawValue :
            reg = jcbClubReg
        default:
            break
        }
        
        if reg != nil {
            let matches: Int = (reg?.numberOfMatches(in: number, options: [], range: NSRange(location: 0, length: number.characters.count)))!
            ret = matches == 1 ? true : false
        }
        return ret
    }
    
   class func luhnCheck(number: String) -> Bool {
        var sum = 0
        let digitStrings = number.characters.reversed().map { String($0) }
        
        for tuple in digitStrings.enumerated() {
            if let digit = Int(tuple.element){
                let odd = tuple.offset % 2 == 1
                
                switch (odd, digit) {
                case (true, 9):
                    sum += 9
                case (true, 0...8):
                    sum += (digit * 2) % 9
                default:
                    sum += digit
                }
            } else {
                return false
            }
        }
        
        return sum % 10 == 0
    }
    class func format(forViewing enteredNumber: String) -> String {
        let cleaned: String = CreditCardValidator.cleanNumber(enteredNumber)
        var len: Int = (cleaned.characters.count ?? 0)
        if len <= CC_LEN_FOR_TYPE {
            return cleaned
        }
        var r2: NSRange
        r2.location = NSNotFound
        var r3: NSRange
        r3.location = NSNotFound
        var r4: NSRange
        r4.location = NSNotFound
        var gaps: [Any] = ["", "", ""]
        let segmentLengths: [Int] = [0, 0, 0]
        switch CreditCardValidator.ccType(proposedNumber: enteredNumber) {
        case creditCardType.visa.rawValue, creditCardType.MasterCard.rawValue, creditCardType.Discover.rawValue:
            // { 4-4-4-4}
            segmentLengths[0] = 4
            segmentLengths[1] = 4
            segmentLengths[2] = 4
            break
        case AMEX:
            // {4-6-5}
            segmentLengths[0] = 6
            segmentLengths[1] = 5
            break
        case DinersClub:
            // {4-6-4}
            segmentLengths[0] = 6
            segmentLengths[1] = 4
            break
            
         case
        }
        
    }
    
//    class func isLuhnValid(_ number: String) -> Bool {
//        let baseNumber: String = number.replacingOccurrences(of: " ", with: "")
//        var total: Int = 0
//        let len: Int = baseNumber.characters.count
//        var i = len
//        while i > 0 {
//            let odd: Bool = (len - i) & 1
//            i -= 1
//            var c: unichar = baseNumber[i]
//            if c < "0" || c > "9" {
//                continue
//            }
//            c -= "0"
//            if odd {
//                c *= 2
//            }
//            if c >= 10 {
//                total += 1
//                c -= 10
//            }
//            total += c
//            
//        }
//        // NSLog(@"LUHN=%d for %@", total, baseNumber);
//        return (total % 10) == 0 ? true : false
//    }
}
