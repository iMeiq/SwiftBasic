//
//  WaveViewController.swift
//  SwiftBasic
//
//  Created by meiqing on 16/4/13.
//  Copyright © 2016年 meiqing. All rights reserved.
//

import UIKit

class WaveViewController: BaseViewController {

    var waveView:MQWaveView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        //wave的调用
        waveView = MQWaveView.init(frame: self.view.bounds)
        waveView.waveSpeed = 5.0
        waveView.waveAmplitude = 10
        self.view.addSubview(waveView)
        waveView.wave()
        
        let riseBar:UIBarButtonItem = UIBarButtonItem.init(title: "上升", style: .Plain, target: self, action: #selector(waveRise))
        let fallBar:UIBarButtonItem = UIBarButtonItem.init(title: "下降", style: .Plain, target: self, action: #selector(waveFall))
        let pauseBar:UIBarButtonItem = UIBarButtonItem.init(title: "暂停", style: .Plain, target: self, action:
            #selector(wavePause))
        let startBar:UIBarButtonItem = UIBarButtonItem.init(title: "恢复", style: .Plain, target: self, action:
            #selector(waveRecover))
        let restartBar:UIBarButtonItem = UIBarButtonItem.init(title: "重新开始", style: .Plain, target: self, action:
            #selector(waveRestart))
        self.navigationItem.rightBarButtonItems = [pauseBar,startBar,restartBar,fallBar,riseBar]
    }

    func waveRise(){
        waveView.rise()
    }
    
    func waveFall(){
        waveView.fall()
    }
    
    func wavePause(){
        waveView.pause()
    }
    
    func waveRecover(){
        waveView.recover()
    }
    
    func waveRestart(){
        waveView.restart()
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
