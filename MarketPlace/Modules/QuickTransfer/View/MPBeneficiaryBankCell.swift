//
//  MPBeneficiaryBankCell.swift
//  MarketPlace
//
//  Created by mac on 2023/7/22.
//

import UIKit

class MPBeneficiaryBankCell: UITableViewCell {
    
    var model = MPBankModel() {
        didSet{
            iconImage.image = UIImage(named: model.image)
            titleLab.text = model.title
            contentLab.text = model.content
        }
    }

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var contentLab: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
