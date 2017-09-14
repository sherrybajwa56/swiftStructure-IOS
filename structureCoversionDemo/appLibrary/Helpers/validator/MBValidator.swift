//
//  MBValidator.swift
//  structureCoversionDemo
//
//  Created by Mobikasa on 13/09/17.
//  Copyright © 2017 mobikasa. All rights reserved.
//

import UIKit

class MBValidator: NSObject {
    
    static let CODE: Int = 10000
    
    class func code() -> Int {
        return CODE
    }
    
    class func message(forCode code: Int) -> String {
        var result: String
        
        switch (code) {
        case 0:
            result = "Success.";
            break;
        case 80:
            result = "Agree terms and condition. Please check.";
            break;
        case 90:
            result = "%@ is blank. Please check.";
            break;
            
        case 100:
            result = "Please provide an username.";
            break;
        case 101:
            result = "Username cannot contain spaces.";
            break;
        case 102:
            result = "Please enter username with valid characters.";
            break;
            
        case 200:
            result = "Please provide a password.";
            break;
        case 201:
            result = "Password should be minimum 6 characters.";
            break;
        case 203:
            result = "Confirm password is blank.";
            break;
        case 204:
            result = "Password mismatch. Please check.";
            break;
        case 205:
            result = "Password should be 6-16 alphanumeric characters.";
            break;
            
            
        case 300:
            result = "BBM pin is blank. Please check.";
            break;
        case 301:
            result = "BBM pin can not contain spaces. Please check.";
            break;
        case 302:
            result = "Invalid BBM pin. Please check.";
            break;
            
        case 400:
            result = "Email is blank. Please check.";
            break;
        case 401:
            result = "Email can not contain spaces. Please check.";
            break;
        case 402:
            result = "Invalid email address. Please check.";
            break;
            
        case 500:
            result = "Mobile no. is blank. Please check.";
            break;
        case 501:
            result = "Mobile no. must be at least 10 digits. Please check.";
            break;
        case 502:
            result = "Mobile no. can not contain spaces. Please check.";
            break;
        case 503:
            result = "Invalid mobile no. Please check.";
            break;
            
        case 600:
            result = "Gender is blank. Please check.";
            break;
        case 700:
            result = "Age is blank. Please check.";
            break;
        case 800:
            result = "Country is blank. Please check.";
            break;
        case 801:
            result = "City is blank. Please check.";
            break;
        case 802:
            result = "State is blank. Please check.";
            break;
        case 803:
            result = "Zip Code is blank. Please check.";
            break;
        case 900:
            result = "Name is blank. Please check.";
            break;
        case 901:
            result = "Invalid characters in name. Please check.";
            break;
        case 903:result = "Specify your gender.";
        break;
        case 904:
            result = "Last Name is blank. Please check.";
            break;
        case 905:
            result = "Address is blank. Please check.";
            break;
            
        case 920:result = "BBM Pin or email, one is required.";
        break;
        case CODE:
            result = "You need to fill either email or phone. Please check.";
            break;
            
        case 1000:
            result = "Password mismatch. Please check.";
            break;
            
        case 1020:
            result = "Please select profile image.";
            break;
            
        case 1100:
            result = "Please select vehicle year.";
            break;
        case 1101:
            result = "Please select vehicle make.";
            break;
        case 1102:
            result = "Please select vehicle model";
            break;
        case 1103:
            result = "Please select School.";
            break;
            
        case 1200:
            result = "Please upload profile image.";
            break;
            
        case 1300:
            result = "Please enter credit card number.";
            break;
        case 1301:
            result = "Invalid credit card. Please check.";
            break;
        case 1302:
            result = "Please enter CVV number.";
            break;
        case 1303:
            result = "Please enter correct CVV number.";
            break;
        case 1304:
            result = "Please enter Expiry date.";
            break;
        case 1305:
            result = "Please enter correct Expiry date.";
            break;
        case 1310:
            result = "Your new and old password should not match each other.";
            break;
        default:
            result = "Something seems wrong. Please check.";
            break;
        }

        return result
    }
    
    class func validateUsername(username: String?) -> Int {
        
        guard let name = username else {
            return 100
        }
        
        if name.characters.count == 0 {
            return 100
        }
        
        if name.range(of:" ") != nil {
            return 101
        }
        let set = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789_.-").inverted
        if name.rangeOfCharacter(from: set) != nil {
            return 102
        }
        return 0
   }
    
    class func validatePassword(_ password: String?) -> Int {
        
        guard let pass = password else {
            return 200
        }

        
        if (pass.characters.count == 0){
            return 200
        }
        if pass.characters.count < 6 {
            return 201
        }
        return 0
    }
    
    class func validateConfirmPassword(_ password: String?) -> Int {
        
        guard let pass = password else {
            return 203
        }
        if (pass.characters.count == 0){
            return 203
        }
        if pass.characters.count < 6 {
            return 204
        }
        return 0
    }
    
    class func validateMobile(Mobile: String?) -> Int {
        
        guard let mobile = Mobile else {
            return 500
        }

        if mobile.characters.count  == 0 {
            return 500
        }
        if mobile.characters.count < 10 || mobile.characters.count > 13 {
            return 501
        }
        if mobile.range(of:" ") != nil  {
            return 502
        }
        return 0
    }
    
    class func validateName(_ Name: String?) -> Int {
        guard let name = Name else {
            return 900
        }

        
        if name.characters.count == 0 {
            return 900
        }
        return 0
    }
    
    class func validateImage(with Data: Data?) -> Int {
        guard let data = Data else {
            return 1020
        }

        if data.count == 0 {
            return 1020
        }
        return 0
    }
    
    class func validateFirstName(_ Name: String?) -> Int {
        
        guard let name = Name else {
            return 900
        }

        if name.characters.count == 0 {
            return 900
        }
        return 0
    }
    
    class func validateLastName(_ Name: String?) -> Int {
        
        
        guard let name = Name else {
            return 904
        }
        
        if name.characters.count == 0 {
            return 904
        }
        return 0

    }
    
    class func validateAddress(_ Name: String?) -> Int {
        
        guard let name = Name else {
            return 905
        }
        
        if name.characters.count == 0 {
            return 905
        }
        return 0

    }
    
    class func validateTermsAndCondition(_ status: Bool) -> Int {
        if !status {
            return 80
        }
        return 0
    }

    
    class func validateEmail(Email: String?) -> Int {
        
        guard let email = Email else {
            return 0
        }
        if email.characters.count == 0{
            return 400
        }
        if email.range(of: " ") != nil {
            return 401
        }
        if email.range(of: "@") != nil {
            return 402
        }
        let array: [String] = email.components(separatedBy: "@")
        
        if array[1].range(of: ".") == nil {
            return 402
        }
        let ar: [String] = array[1].components(separatedBy: ".")
        
        if ar[0].characters.count == 0 || ar[1].characters.count == 0 {
            return 402
        }
        if !(ar.last == "edu") {
            return 402
        }
        return 0
    }
    class func validateGender( Gender: String?) -> Int {
        guard let gender = Gender else {
            return 600
        }
        
        if gender.characters.count  == 0 {
            return 600
        }
        return 0
    }
    
    class func validateAge(_Age: String?) -> Int {
        
        guard let age = _Age else {
            return 700
        }

        if age.characters.count == 0 {
            return 700
        }
        return 0
    }
    
    class func validateCountry( Country: String?) -> Int {
        
        guard let country = Country else {
            return 800
        }
        

        if country.characters.count == 0 {
            return 800
        }
        return 0
    }
    
    class func validateCity(_ City: String?) -> Int {
        guard let city = City else {
            return 801
        }
        
        if city.characters.count == 0 {
            return 801
        }
        return 0
    }
    class func validateState(_ State: String?) -> Int {
        
        guard let state = State else {
            return 802
        }

        if state.characters.count  == 0 {
            return 802
        }
        return 0
    }
    
    class func validateZipCode( Zip: String?) -> Int {
        guard let zip = Zip else {
            return 803
        }

        if zip.characters.count  == 0 {
            return 803
        }
        return 0
    }
    
    class func matchPassword(_ Password1: String?, withConfirmed Password2: String?) -> Int {
        guard let password1 = Password1 else {
            return 1000
        }
        guard let password2 = Password2 else {
            return 1000
        }

        if password1 != password2 {
            return 1000
        }
        return 0
    }
    
      class func validateProfileImage(_ Key: String?) -> Int {
        guard let key = Key else {
            return 1200
        }
        if key.characters.count == 0 {
            return 1200
        }
        return 0
    }
    
//    class func validateCreditCardNumber(cardNo: String) -> Int {
//        if cardNo.characters.count == 0 {
//            return 1300
//        }
//        let status: Bool = CreditCardValidator.isValidNumber(cardNo.replacingOccurrences(of: " ", with: ""))
//        if status {
//            return 0
//        }
//        return 1301
//    }
    
    class func validateCvvNumber(CardNo: String) -> Int {
        if CardNo.characters.count == 0 {
            return 1302
        }
        if CardNo.characters.count == 3 {
            return 0
        }
        return 1303
    }

    //Credit card validatio
    
    class func validateExpDate(_ cardNo: String) -> Int {
        if cardNo.characters.count  == 0 {
            return 1304
        }
        if cardNo.characters.count > 0 {
            return 0
        }
        return 1305
    }
    
    // MARK: - To check text field is empty
    class func isTextEmpty(str: String?) -> Int {
        
        guard let string = str else {
            return 90
        }
        if string.trimmingCharacters(in: CharacterSet.whitespaces).characters.count == 0 {
            return 90
        }
        return 0
    }
    class func textIsValidEmailFormat(_ email: String) -> Int {
      //  let stricterFilter: Bool = true
        let stricterFilterString: String = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
        //let laxString: String = ".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*"
        
        let emailRegex: String = stricterFilterString
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        if !emailTest.evaluate(with: email) {
            return 402
        }
        return 0
    }

    class func removeWhiteSpace(in str: String) -> String {
        
        return str.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    // MARK: - Check Password is alphanumeric
    class func isAlphaNumericAndContainsAtLeastSixDigit(str: String) -> Bool {
        
        if (str.characters.count > 5 && str.characters.count < 17 && str.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil && str.rangeOfCharacter(from: CharacterSet.lowercaseLetters) != nil || str.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil) {
            return true
        }
        return false
    }
    
   static let ACCEPTABLE_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    
    class func isAlphaBets(_ str: String) -> Bool {
        let cs = CharacterSet(charactersIn: MBValidator.ACCEPTABLE_CHARACTERS).inverted
        if (str.rangeOfCharacter(from: cs) == nil) {
            return true
        }
        return false
    }
    
    class func validatePhoneNumber(mobilenumber: String?) -> Bool {
        guard var mobileNumber = mobilenumber  else {
            return false
        }
        if mobileNumber.characters.count  > 0 {
            mobileNumber = mobileNumber.replacingOccurrences(of: "(", with: "")
            mobileNumber = mobileNumber.replacingOccurrences(of: ")", with: "")
            mobileNumber = mobileNumber.replacingOccurrences(of: " ", with: "")
            mobileNumber = mobileNumber.replacingOccurrences(of: "-", with: "")
            mobileNumber = mobileNumber.replacingOccurrences(of: "+", with: "")
            var valid: Bool
            let alphaNums = CharacterSet.decimalDigits
            let inStringSet = CharacterSet(charactersIn: mobileNumber)
            valid = alphaNums.isSuperset(of: inStringSet)
            if mobileNumber.characters.count == 10 {
                return valid ? true : false
            }
            else {
                return false
            }
        }
        else {
            return false
        }
   }
    class func getLength(_ mobileNumber: String?) -> Int {
       
        guard let mobilenumber = mobileNumber else{
            return 0
        }
        let filteredString = mobilenumber.replacingOccurrences(of: "[^0-9]", with:"", options: .regularExpression, range: nil).trimmingCharacters(in: CharacterSet.whitespaces)
        
        let length: Int = filteredString.characters.count
        return length
    }
    class func formatNumber( mobilenumber: String?) -> String {
        
        guard let mobileNumber = mobilenumber else {
            return ""
        }
        let result = mobileNumber.replacingOccurrences(of: "[^0-9]", with:"", options:.regularExpression, range: nil).trimmingCharacters(in: CharacterSet.whitespaces)

        return result
    }
    
//    class func textField(_ textField: UITextField, changeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if (string == "*") || (string == "+") || (string == "#") || (string == ".") || (string == ",") || (string == ";") {
//            return false
//        }
//        let length: Int = MBValidator.getLength(textField.text)
//        if length == 10 {
//            if range.length == 0 {
//                return false
//            }
//        }
//        var newString: String = textField.text?.replacingCharacters(in: range, with: string)
//
//        let charactersToRemove = CharacterSet.alphanumerics.inverted
//
//        newString = (newString.components(separatedBy: charactersToRemove) as NSArray).componentsJoined(byString: "")
//
//        let expression: String = "^([0-9]+)?(\\.([0-9]{1,2})?)?$"
//        let regex = try? NSRegularExpression(pattern: expression, options: .caseInsensitive)
//        let numberOfMatches: Int? = regex?.numberOfMatches(in: newString, options: [], range: NSRange(location: 0, length: newString.length()))
//        if numberOfMatches == 0 {
//            return false
//        }
//        if length == 3 {
//            let num: String = MBValidator.formatNumber(textField.text)
//            textField.text = "(\(num))"
//            if range.length > 0 {
//                textField.text = "\(num as? NSString)?.substring(to: 3)"
//            }
//        }
//       else if length == 6 {
//            let num: String = MBValidator.formatNumber(textField.text)
//            //NSLog(@"%@",[num  substringToIndex:3]);
//            //NSLog(@"%@",[num substringFromIndex:3]);
//            textField.text = "(\(num as? NSString)?.substring(to: 3)) \(num as? NSString)?.substring(from: 3)-"
//            if range.length > 0 {
//                textField.text = "(\(num as? NSString)?.substring(to: 3)) \(num as? NSString)?.substring(from: 3)"
//            }
//        }
//        return true
//    }

}
