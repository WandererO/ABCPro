//
//  MPWelcomeView.swift
//  MarketPlace
//
//  Created by mac on 2023/7/15.
//

import UIKit

class MPWelcomeView: UIView {

}

class WelcomeButtonView : UIButton {
    
    var title = "" {
        didSet {
            titLab.text = title
        }
    }
    var image:UIImage? {
        didSet{
            iconImg.image = image
        }
    }
    
    lazy var titLab : UILabel = {
        let lab = UILabel()
        lab.textColor = .white
        lab.font = FONT_M(size: 14)//FONT_R(size: 14)
        lab.text = "Register"
        return lab
    }()
    
    lazy var iconImg : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "ic_register1")
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imgBgView = UIView()
        imgBgView.backgroundColor = .hexColor("000000", alpha: 0.3)
        imgBgView.corner(cornerRadius: 20)
        self.addSubview(imgBgView)
        imgBgView.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.width.height.equalTo(40)
        }
        imgBgView.addSubview(iconImg)
        iconImg.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
        self.addSubview(titLab)
        titLab.snp.makeConstraints { make in
            make.left.equalTo(imgBgView.snp.right).offset(10)
            make.centerY.equalToSuperview()
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

