//
//  MQToastView.swift
//  SwiftBasic
//
//  Created by meiqing on 16/4/6.
//  Copyright © 2016年 meiqing. All rights reserved.
//
/*
        ============= 使用方法 ===============
         let toast:MQToastView = MQToastView.init(message: "温馨提示",content:"你确定要退出登录吗？")
         self.view.addSubview(toast)
         toast.cancelblo = {
         //取消处理
         print("取消")
         }
         toast.certainblo = {
         //确定处理
         print("确定")
         }
 */


import UIKit
import SnapKit

class MQToastView: UIView {
    
    typealias ToastBlock = ()->()
    var cancelblo:ToastBlock?
    var certainblo:ToastBlock?
    
    let VWIDTH:CGFloat = 250
    let VHEIGHT:CGFloat = 130
    let BACKFRAME:CGRect = (UIApplication.sharedApplication().keyWindow?.bounds)!

    var TWIDTH:CGFloat = 0
    var THEIGHT:CGFloat = 0
    
    var message:String?
    
    var backView:UIView!
    
    var view:UIView!
    
    convenience init(message:String!,content:String!){
        
        self.init()
        self.frame = (UIApplication.sharedApplication().keyWindow?.bounds)!
        print("toast",message);
        
        backView = UIView.init()
        backView.frame = BACKFRAME
        backView.backgroundColor = UIColor.blackColor()
        backView.alpha = 0.6
        self.addSubview(backView)
        
        TWIDTH = BACKFRAME.width
        THEIGHT = BACKFRAME.height
        
        view = UIView.init()
        view.frame = CGRectMake(TWIDTH/2-VWIDTH/2, -VHEIGHT, VWIDTH, VHEIGHT)
        view.backgroundColor = UIColor.whiteColor()
        view.layer.cornerRadius = 3
        view.layer.masksToBounds = true
        view.userInteractionEnabled = true
        backView.addSubview(view)
        
        let tLabel  = UILabel.init()
        tLabel.frame = CGRectMake(0, 10, VWIDTH, 30)
        tLabel.textAlignment = NSTextAlignment.Center
        tLabel.font = UIFont.boldSystemFontOfSize(16)
        tLabel.textColor = UIColor.blackColor()
        tLabel.numberOfLines = 0
        tLabel.text = message
        view.addSubview(tLabel)
        
        let cLabel  = UILabel.init()
        cLabel.frame = CGRectMake(0, CGRectGetMaxY(tLabel.frame), VWIDTH, 30)
        cLabel.textAlignment = NSTextAlignment.Center
        cLabel.textColor = UIColor(rgba: "7C7C7C")
        cLabel.font = UIFont.systemFontOfSize(15)
        cLabel.numberOfLines = 0
        cLabel.text = content
        view.addSubview(cLabel)
        
        let vLine = UIView.init()
        vLine.frame = CGRectMake(0, view.frame.size.height-35, view.frame.size.width, 1)
        vLine.backgroundColor = UIColor.grayColor()
        view.addSubview(vLine)
        
        let hLine = UIView.init()
        hLine.frame = CGRectMake(vLine.frame.size.width/2-0.5, CGRectGetMaxY(vLine.frame), 1, 34)
        hLine.backgroundColor = UIColor.grayColor()
        view.addSubview(hLine)
        
        let leftButton:UIButton = UIButton.init(type: .System)
        leftButton.frame = CGRectMake(0, hLine.frame.origin.y, view.frame.width/2, 34)
        leftButton.setTitle("取消", forState: .Normal)
        leftButton.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        leftButton.addTarget(self, action: #selector(self.cancelClick), forControlEvents: .TouchUpInside)
        view.addSubview(leftButton)
    
        let rightButton:UIButton = UIButton.init(type: .System)
        rightButton.frame = CGRectMake(view.frame.width/2, hLine.frame.origin.y, view.frame.width/2, 34)
        rightButton.setTitle("确定", forState: .Normal)
        rightButton.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        rightButton.addTarget(self, action: #selector(self.certainClick), forControlEvents: .TouchUpInside)
        view.addSubview(rightButton)
        
        self.initAnimation()
    }
    
    func initAnimation(){
        
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .CurveEaseOut, animations:{
        self.view.frame = CGRectMake(self.TWIDTH/2-self.VWIDTH/2, self.THEIGHT/2-self.VHEIGHT/2, self.VWIDTH, self.VHEIGHT)
        }, completion:nil)
    }
    
    func certainClick() {
        self.dismiss()
        self.certainblo?()
    }
    
    func cancelClick()  {
        self.dismiss()
        self.cancelblo?()
    }
    
    func dismiss() {
        
        UIView.animateWithDuration(0.3, animations: {
            self.view.frame = CGRectMake(self.TWIDTH/2-self.VWIDTH/2, self.THEIGHT, self.VWIDTH, self.VHEIGHT)
            self.view.alpha = 0.3
            self.backView.alpha = 0
            }) { (success) in
                print("dismiss = ", success.boolValue)
                self .removeFromSuperview()
        }
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
