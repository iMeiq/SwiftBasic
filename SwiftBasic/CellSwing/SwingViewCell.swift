//
//  SwingViewCell.swift
//  SwiftBasic
//
//  Created by meiqing on 16/4/12.
//  Copyright © 2016年 meiqing. All rights reserved.
//

import UIKit

class SwingViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func startAnimationWithDelayTime(delayTime:Double){
        
        let cell_width = self.contentView.frame.size.width
        self.contentView.transform = CGAffineTransformMakeTranslation(cell_width, 0);
        
        UIView.animateWithDuration(1, delay: delayTime, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .LayoutSubviews, animations: {
            self.contentView.transform = CGAffineTransformIdentity
            }, completion: nil)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
