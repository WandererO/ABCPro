//
//  MPTopupCell.swift
//  MarketPlace
//
//  Created by mac on 2023/7/20.
//

import UIKit

class MPTopupCell: UICollectionViewCell {

    @IBOutlet weak var titleLab: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .clear
        self.corner(cornerRadius: 8, borderColor: .white, borderWidth: 1)
    }
    
    private var isSelect: Bool = false
    override var isSelected: Bool {
        set {
                self.isSelect = newValue
                if newValue {
                    self.setSelectedStyle()
                } else {
                    self.setDeSelectedStyle()
                }
            }
        get {
            return self.isSelect
        }
    }
    
    private func setSelectedStyle() {
        self.backgroundColor = kInputTextColor
        self.corner(cornerRadius: 8, borderColor: .white, borderWidth: 0)
    }
    
    private func setDeSelectedStyle() {
        self.backgroundColor = .clear
        self.corner(cornerRadius: 8, borderColor: .white, borderWidth: 1)
    }

}
