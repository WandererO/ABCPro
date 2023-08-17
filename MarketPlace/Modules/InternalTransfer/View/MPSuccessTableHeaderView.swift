//
//  MPSuccessTableHeaderView.swift
//  MarketPlace
//
//  Created by mac on 2023/8/16.
//

import UIKit

class MPSuccessTableHeaderView: BaseView {
    
    var amount = "" {
        didSet{
            amountLab.text = amount
        }
    }
    
    var times = "" {
        didSet{
            timesLab.text = times
        }
    }
    
    
    let amountLab = UILabel()
    let timesLab = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        let iconImage = UIImageView()
        iconImage.image = UIImage(named: "login_logo_ic_Normal")
        self.addSubview(iconImage)
        iconImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(160)
            make.height.equalTo(23)
            make.top.equalTo(15)
        }
        
        let successImage = UIImageView()
        successImage.image = UIImage(named: "alert_success_ic_Normal")
        self.addSubview(successImage)
        successImage.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
        let successLab = UILabel()
        successLab.text = "SUCCESSFUL TRANSFER".localString()
        successLab.font = FONT_SB(size: 16)
        successLab.textColor = .white
        self.addSubview(successLab)
        successLab.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(successImage.snp.bottom).offset(15)
        }
        
        amountLab.text = "12000 VND"
        amountLab.font = FONT_SB(size: 22)
        amountLab.textColor = RGBCOLOR(r: 132, g: 188, b: 57)
        self.addSubview(amountLab)
        amountLab.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(successLab.snp.bottom).offset(10)
        }
        
        
        timesLab.text = "14:42 Wednesday 16/08/2023"
        timesLab.textColor = RGBCOLOR(r: 135, g: 145, b: 147)
        timesLab.font = FONT_M(size: 12)
        self.addSubview(timesLab)
        timesLab.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(amountLab.snp.bottom).offset(10)
        }
        
        let lineV = UIView()
        lineV.backgroundColor = RGBCOLOR(r: 65, g: 79, b: 84)
        self.addSubview(lineV)
        lineV.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.equalTo(-1)
            make.height.equalTo(1)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class MPTableFootView : BaseView {
    
    //icShare_Normal icSaveimage_Normal icBenificiary_Normal
    
    let leftV = ImageWithTitleView()
    let middleV = ImageWithTitleView()
    let rightV = ImageWithTitleView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        leftV.image = UIImage(named: "icShare_Normal")
        leftV.title = "Share".localString()
        middleV.image = UIImage(named: "icSaveimage_Normal")
        middleV.title = "Save picture".localString()
        rightV.image = UIImage(named: "icBenificiary_Normal")
        rightV.title = "Save beneficiary".localString()
        self.addSubview(leftV)
        self.addSubview(middleV)
        self.addSubview(rightV)
        [leftV, middleV, rightV].snp.distributeViewsAlong(axisType:.horizontal, fixedItemLength:100, leadSpacing:30, tailSpacing:30)
        [leftV, middleV, rightV].snp.makeConstraints { make in
            make.top.equalTo(30)
            make.height.equalTo(100)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class ImageWithTitleView : BaseView {
    
    var image : UIImage? {
        didSet{
            topImage.image = image
        }
    }
    
    var title = "" {
        didSet{
            titleLab.text = title
        }
    }
    
    let topImage = UIImageView()
    let titleLab = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(topImage)
        topImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        titleLab.textColor = RGBCOLOR(r: 120, g: 130, b: 134)
        titleLab.font = FONT_M(size: 14)
        titleLab.textAlignment = .center
        titleLab.numberOfLines = 0
        self.addSubview(titleLab)
        titleLab.snp.makeConstraints { make in
            make.top.equalTo(topImage.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview()
//            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
