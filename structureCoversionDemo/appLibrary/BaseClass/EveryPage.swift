//
//  EveryPage.swift
//  structureCoversionDemo
//
//  Created by Mobikasa on 28/09/17.
//  Copyright © 2017 mobikasa. All rights reserved.
//

import UIKit

import MarqueeLabel

class EveryPage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   public func setTitle(_ title: String, isBold: Bool) {
    
        let label = MarqueeLabel(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
    
        label.trailingBuffer = 30
    
    
       // label.font =  // UIFont.ed_AppFont(withType: isBold ? Bold : Regular, withSize: 18)
    
        label.text = title
        label.shadowColor = UIColor.clear
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.backgroundColor = UIColor.white
        if tabBarController != nil {
            tabBarController?.navigationItem.titleView = label as? UIView
        }
        else {
            navigationItem.titleView = label as? UIView
        }
        navigationController?.navigationBar.isTranslucent = false
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


