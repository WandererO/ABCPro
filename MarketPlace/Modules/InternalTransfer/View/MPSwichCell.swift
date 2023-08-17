//
//  MPSwichCell.swift
//  MarketPlace
//
//  Created by mac on 2023/8/16.
//

import UIKit

class MPSwichCell: UITableViewCell {

    @IBOutlet weak var titleLab: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = .clear
        
        titleLab.text = "Save transfer template".localString()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        

        // Configure the view for the selected state
    }
    
}
