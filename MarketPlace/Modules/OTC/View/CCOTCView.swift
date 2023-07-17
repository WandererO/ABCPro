//
//  CCOTCView.swift
//  MarketPlace
//
//  Created by mac on 2023/3/9.
//

import UIKit

class CCOTCView: UIView {


}

class OTCTopView : UIView {
    
    lazy var choiseBtn : ZQButton = {
        let btn = ZQButton()
        btn.setTitle("快捷交易", for: .normal)
        btn.setImage(UIImage(named: ""), for: .normal)
        return btn
    }()
    
    
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        self.backgroundColor = .hexColor("F5F5F5")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
