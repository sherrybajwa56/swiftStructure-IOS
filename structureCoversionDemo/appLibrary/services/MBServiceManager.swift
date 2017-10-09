//
//  MBServiceManager.swift
//  structureCoversionDemo
//
//  Created by Mobikasa on 09/10/17.
//  Copyright © 2017 mobikasa. All rights reserved.
//

import UIKit

class MBServiceManager: NSObject {

   public static func  getallDataAPI() -> Void {
    
   // HTTPClient.shared.getRequests(baseUrl: "http://api.fixer.io/latest?base=USD")
    HTTPClient.shared.getRequest(baseUrl: "http://api.fixer.o/latest?base=USD:" , params: nil) { (params, status, error) in
        
    }
   
    }
    
}
