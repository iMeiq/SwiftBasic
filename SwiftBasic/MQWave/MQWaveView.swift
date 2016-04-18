//
//  MQWaveView.swift
//  SwiftBasic
//
//  Created by meiqing on 16/4/13.
//  Copyright © 2016年 meiqing. All rights reserved.
//

import UIKit

class MQWaveView: UIView {

    var waveSpeed:CGFloat!
    var waveAmplitude:CGFloat?
    
    var waveDisplaylink:CADisplayLink?
    var waveLayer:CAShapeLayer?
    var wavePath:UIBezierPath?
    
    var offsetX:CGFloat!=0
    var waveHeight:CGFloat!=0
    var waveWidth:CGFloat?
    
    var delta:CGFloat! = -0.5
    
    override init(frame: CGRect) {
      super.init(frame: frame)

      waveHeight = frame.size.height
      waveWidth = frame.size.width
        
      wavePath = UIBezierPath.init()
      waveLayer = CAShapeLayer.init()
      waveLayer?.fillColor = UIColor(rgba:"32BAFA").CGColor
      self.layer.addSublayer(waveLayer!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 波动起来
    func wave() {
        
        waveDisplaylink = CADisplayLink.init(target: self, selector: #selector(getCurrentWave))
        waveDisplaylink!.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSRunLoopCommonModes)
    }
    // 暂停
    func pause() {
        waveDisplaylink!.paused = true
    }
    // 上升
    func rise (){
        waveDisplaylink!.paused = false
        delta = -0.5
    }
    // 下降
    func fall(){
        waveDisplaylink!.paused = false
        delta = 0.5
    }
    // 上升
    func recover() {
        waveDisplaylink!.paused = false
    }
    // 重新开始
    func restart() {
        waveHeight = frame.size.height
    }
    // 销毁定时器
    func cancelWave() {
        waveDisplaylink?.invalidate()
        waveDisplaylink = nil
    }
    
    func getCurrentWave () {
        if waveHeight<0 {
            waveHeight=0
        }
        if waveHeight>self.frame.size.height {
            waveHeight=self.frame.size.height
        }
        waveHeight =  delta + waveHeight
        offsetX = self.waveSpeed + offsetX
        waveLayer?.path = self.getCurrentWavePath()
    }
    
    func getCurrentWavePath()->(CGPathRef) {
        
        let path:CGMutablePathRef = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, 0, waveHeight!)
        var y:CGFloat = 0.0
               
        for x in 0 ..< Int(waveWidth!) {
            let standardValue = (2*M_PI*Double(x))/Double(self.waveWidth!)
            let offsetValue = Double(offsetX)*M_PI/180
            let result:Float = Float(standardValue - offsetValue)
            y = self.waveAmplitude! * CGFloat(sinf(result))+waveHeight!
            CGPathAddLineToPoint(path, nil, CGFloat(x), CGFloat(y))
        }
        CGPathAddLineToPoint(path,nil,waveWidth!,self.frame.size.height)
        CGPathAddLineToPoint(path,nil,0,self.frame.size.height)
        CGPathCloseSubpath(path)
        return path
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
