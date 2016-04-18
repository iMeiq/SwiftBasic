//
//  ViewController.swift
//  SwiftBasic
//
//  Created by meiqing on 16/1/4.
//  Copyright © 2016年 meiqing. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    let  leftButton = UIButton(type: UIButtonType.System) as UIButton
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationController!.navigationBarHidden = false
        self.navigationController!.navigationBar.translucent = false
        self.navigationItem.title = "✎      swift动画小插件     ✎"
        self.view.backgroundColor = UIColor(rgba: "FFFFFF");
        
        let tableView:UITableView = UITableView.init(frame: self.view.bounds, style: .Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        self.view.addSubview(tableView)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray().count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cell"
        let cell = UITableViewCell.init(style: .Default, reuseIdentifier: cellId)
        cell.textLabel?.text = self.titleArray().objectAtIndex(indexPath.row) as? String
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            self.toast()
        case 1:
            self.roationHud()
        case 2:
            self.cellSwing()
        case 3:
            self.wave()
        case 4:
            self.OC()
        default:
            break
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func titleArray()->NSArray {
        return ["自定义alertView","加载动画(5秒后消失)","cell摇摆进入动画","波浪容器","Swift调OC"]
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }

    func OC() {
        let ocvc = OCViewController()
        self.MQPushViewController(ocvc, boolValue: true)
    }
    
    func wave() {
        let wvc:WaveViewController = WaveViewController()
        self.MQPushViewController(wvc, boolValue: true)
    }
    
    func cellSwing() {
        let svc:SwingViewController = SwingViewController()
        self.MQPushViewController(svc, boolValue: true)
    }
    
    func roationHud() {
        
        let hud:MQRotationHud = MQRotationHud.init(message:"转动")
        self.view.window!.addSubview(hud)
        hud.show()
        
        //5秒后隐藏
        let delta = 5.0 * Double(NSEC_PER_SEC)
        let dtime = dispatch_time(DISPATCH_TIME_NOW, Int64(delta))
        dispatch_after(dtime, dispatch_get_main_queue()) { () -> Void in
            hud.hide()
        }
    }
    
    func toast() {
        
        let toast:MQToastView = MQToastView.init(message: "温馨提示",content:"你确定要退出登录吗？")
        self.view.window!.addSubview(toast)
        toast.cancelblo = {
            //取消处理
            print("取消")
        }
        toast.certainblo = {
            //确定处理
            print("确定")
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

