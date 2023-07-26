//
//  MPAccountTotalCell.swift
//  MarketPlace
//
//  Created by 世文 on 2023/7/21.
//

import UIKit

class MPAccountTotalCell: UITableViewCell {
    
    
    var model = MPAccountModel() {
        didSet{
           
            contentLable.text = model.content
            timeLable.text = model.date
            
            if model.type == "2" {//转出
                moeny.text = "- " + model.amount.getShowPrice()
                moeny.textColor = .red
            }else{
                moeny.text = model.amount.getShowPrice()
                moeny.textColor = UIColor(173, 208, 65, 1)
            }
        }
    }
    

    @IBOutlet weak var moeny: UILabel!
    @IBOutlet weak var contentLable: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        moeny.text = "10000000".getShowPrice()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
