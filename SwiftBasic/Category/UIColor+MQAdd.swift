//
//  File.swift
//  SwiftBasic
//
//  Created by meiqing on 16/1/4.
//  Copyright © 2016年 meiqing. All rights reserved.
//

import UIKit

extension UIColor{
    convenience init(rgba :String) {
        let scanner = NSScanner(string: rgba)
        var hexNum = 0 as UInt32
        
        if (scanner.scanHexInt(&hexNum)){
            let r = (hexNum >> 16) & 0xFF
            let g = (hexNum >> 8) & 0xFF
            let b = (hexNum) & 0xFF
            
            self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
        }else{
            self.init()
        }
    }
}