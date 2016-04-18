//
//  MQRotationHud.swift
//  SwiftBasic
//
//  Created by meiqing on 16/4/11.
//  Copyright © 2016年 meiqing. All rights reserved.
//

import UIKit

class MQRotationHud: UIView {

    var PWIDTH:CGFloat = 150
    var PHEIGHT:CGFloat = 120
    
    var VWIDTH:CGFloat = 72
    var VHEIGHT:CGFloat = 72
    
    var backlayer: CALayer?
    var frontLayer: CALayer?
    
    convenience init(message:String){
    
        self.init()
        self.frame = (UIApplication.sharedApplication().keyWindow?.bounds)!
        self.addSubview(self.shadeView)
    
        self.shadeView.addSubview(self.platView)
        self.platView.addSubview(self.backView)
        self.backView.addSubview(self.frontView)
        
        self.backlayer?.anchorPoint = CGPointMake(0.5, 0.5)
        self.backlayer?.contents = self.backView.image?.CGImage
        
        self.frontLayer?.anchorPoint = CGPointMake(0.5, 0.5)
        self.frontLayer?.contents = self.frontView.image?.CGImage
        self.frontLayer = self.frontView.layer
        self.hidden = true
        
    }
    
    func show(){
        if self.hidden == true {
            self.hidden = false
            self.superview?.bringSubviewToFront(self)
            self.addAnimation()
            self.alpha = 0
            UIView.animateWithDuration(0.3, animations: { 
                self.alpha = 1
            })
        }
    }
    
    func hide(){
        self.frontLayer!.removeAllAnimations()
        self.alpha = 0
        self.hidden = true
    }
    
    func removeAnimation() {
        self.frontLayer?.removeAllAnimations()
    }
    
    func addAnimation() {
        self.removeAnimation()
        let spin:CABasicAnimation = CABasicAnimation.init(keyPath: "transform.rotation.z")
        spin.byValue = M_PI*2
        spin.duration = 1.0
        spin.delegate = self
        spin.repeatCount = FLT_MAX
        spin.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
        spin.removedOnCompletion = true
        self.frontLayer?.addAnimation(spin, forKey: "rotation")
    }
    
    lazy var frontView:UIImageView = {
        var frontView = UIImageView.init()
        frontView.frame = CGRectMake(0, 0, self.VWIDTH, self.VHEIGHT)
        frontView.image = UIImage.init(named: "hudCircle")
        return frontView
    }()
    
    lazy var platView:UIView = {
        var platView = UIImageView.init()
        let TWIDTH:CGFloat = self.shadeView.frame.size.width
        let THEIGHT:CGFloat = self.shadeView.frame.size.height
        platView.frame = CGRectMake(TWIDTH/2-self.PWIDTH/2, THEIGHT/2-self.PHEIGHT/2, self.PWIDTH, self.PHEIGHT)
        platView.backgroundColor = UIColor.blackColor();
        platView.alpha = 0.7
        platView.layer.cornerRadius = 3
        platView.layer.masksToBounds = true
        return platView
    }()
    
    lazy var backView:UIImageView = {
        var backView = UIImageView.init()
        backView.frame = CGRectMake(self.PWIDTH/2-self.VWIDTH/2, self.PHEIGHT/2-self.VHEIGHT/2, self.VWIDTH, self.VHEIGHT)
        backView.image = UIImage.init(named: "hudBack")
        return backView
    }()
    
    lazy var shadeView:UIImageView = {
        var shadeView = UIImageView.init()
        shadeView.frame = self.bounds
        return shadeView
    }()
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
