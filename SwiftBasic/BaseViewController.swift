//
//  BaseViewController.swift
//  SwiftBasic
//
//  Created by meiqing on 16/1/4.
//  Copyright © 2016年 meiqing. All rights reserved.
//

import UIKit

let BG_COLOR = UIColor(rgba: "e6e6e6")

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = BG_COLOR;
    }

    func MQPushViewController(vc:UIViewController, boolValue:Bool) {
    
        self.navigationController!.pushViewController(vc, animated: boolValue)
        let item = UIBarButtonItem(title: "返回", style: .Plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = item;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
