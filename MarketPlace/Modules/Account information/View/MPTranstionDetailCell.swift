//
//  MPTranstionDetailCell.swift
//  MarketPlace
//
//  Created by mac on 2023/7/23.
//

import UIKit

class MPTranstionDetailCell: UITableViewCell {
    
//    var model = MPAccountModel() {
//        didSet{
//
//        }
//    }
    
    var dict:[String:String]? {
        didSet{
            if let dict {
                titleLab.text = dict["title"]
                valueLab.text = dict["value"]
            }
        }
    }

    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var valueLab: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
