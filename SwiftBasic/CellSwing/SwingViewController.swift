//
//  SwingViewController.swift
//  SwiftBasic
//
//  Created by meiqing on 16/4/12.
//  Copyright © 2016年 meiqing. All rights reserved.
//

import UIKit

class SwingViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    var isShowAnimation = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let tableView:UITableView = UITableView.init(frame: self.view.bounds, style: .Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        self.view.addSubview(tableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cell"
        let cell = SwingViewCell.init(style: .Default, reuseIdentifier: cellId)
        cell.contentView.backgroundColor = UIColor.greenColor()
        cell.textLabel?.text = "第\(indexPath.row)行进入"
        return cell
    }

    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if !isShowAnimation {
            return
        }
        let initialDelay:Double = 0.2
        let stutter:Double = 0.06
        let delay :Double = initialDelay + Double(indexPath.row)*stutter
        let swingCell:SwingViewCell = (cell as?SwingViewCell)!
        swingCell.startAnimationWithDelayTime(delay)
        if indexPath.row==10 {
            isShowAnimation = false
        }
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
