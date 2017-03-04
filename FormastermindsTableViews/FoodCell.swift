//
//  FoodCell.swift
//  FormastermindsTableViews
//
//  Created by WuQiang on 2017/3/4.
//  Copyright © 2017年 WuQiang. All rights reserved.
//

import UIKit

class FoodCell: UITableViewCell {
    
    @IBOutlet weak var cellTitle: UILabel!
    
    @IBOutlet weak var cellImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
