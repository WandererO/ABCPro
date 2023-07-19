//
//  MPCustomTabbarView.swift
//  MarketPlace
//
//  Created by mac on 2023/7/19.
//

import UIKit

class MPCustomTabbarView: BaseView {
    
    lazy var homeBtn : ZQButton = {
        let btn = ZQButton()
        btn.setImage(UIImage(named: ""), for: .normal)
        btn.setTitle("", for: .normal)
        btn.titleLabel?.font = FONT_R(size: 12)
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
