//
//  HTTPClient.swift
//  structureCoversionDemo
//
//  Created by Mobikasa on 09/10/17.
//  Copyright © 2017 mobikasa. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class HTTPClient : NSObject{
    
    static let shared = HTTPClient()
    
    let CompletionHandler: (Data?, URLResponse?, Error?) -> Void = {
        (data, response, error) in
        // this is where the completion handler code goes
        if let response = response {
            print(response)
        }
        if let error = error {
            print(error)
        }
    }
   func getRequest(baseUrl:String, params:Dictionary<String, Any>?, completionBlock:@escaping (([String:Any]?, Bool, String?) -> Void) )  {

    
        Alamofire.request(baseUrl).responseJSON { (responseData) in
           
            switch (responseData.result){
                
            case .success(_):
           
                if let response = responseData.result.value{
                    
                    completionBlock(response as? [String : Any] ,true, nil)
                }
                break
            case .failure(_):
                 completionBlock(nil,false, responseData.result.error!.localizedDescription)
                break
            }
           
        }

    }
    
    
    
}
