//
//  TableViewCell.swift
//  notificationClass
//
//  Created by hoanganh on 4/8/19.
//  Copyright © 2019 hoanganh. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var names: UILabel!
    
    @IBOutlet weak var price: UILabel!
    var indexPath: IndexPath?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
