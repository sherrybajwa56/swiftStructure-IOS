//
//  ViewController.swift
//  structureCoversionDemo
//
//  Created by Mobikasa on 07/09/17.
//  Copyright © 2017 mobikasa. All rights reserved.
//

import UIKit
import PKHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
         HUD.flash(.success, delay: 2.0)
        
        //  print(AppConstants.IS_NETWORK_REACHABLE)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }


}

