//
//  MPTransactionHistoryController.swift
//  MarketPlace
//
//  Created by mac on 2023/7/23.
//

import UIKit

class MPTransactionHistoryController: BaseHiddenNaviController {
    
    lazy var fromTimeBtn : MPSelectTimeButton = {
        let btn = MPSelectTimeButton()
        btn.title = "02/07/2023"
        btn.backgroundColor = .white
        btn.corner(cornerRadius: 6)
        return btn
    }()
    
    lazy var toTimeBtn : MPSelectTimeButton = {
        let btn = MPSelectTimeButton()
        btn.title = "22/07/2023"
        btn.backgroundColor = .white
        btn.corner(cornerRadius: 6)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Transaction history"
        self.topViewLeftBtn.setImage(UIImage(named: "ic_back_family_Normal"), for: .normal)
        // Do any additional setup after loading the view.
        //添加底部背景图
        let homeBgImage = UIImageView(frame: .zero)
        homeBgImage.image = UIImage(named: "homebg_1_Normal")
        homeBgImage.contentMode = .scaleAspectFill
        self.view.addSubview(homeBgImage)
        homeBgImage.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(48 + STATUSBAR_HIGH)
        }
        
        let bgView = UIView()
        bgView.backgroundColor = UIColor(17, 34, 42, 0).withAlphaComponent(0.8)
        self.view.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.headerView.snp.bottom)
        }
        
        setUI()
    }
    
    func setUI(){
        self.view.addSubview(fromTimeBtn)
        self.view.addSubview(toTimeBtn)
        [fromTimeBtn, toTimeBtn].snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: 15, leadSpacing: 20, tailSpacing: 20)
        [fromTimeBtn, toTimeBtn].snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(30)
            make.height.equalTo(40)
        }
        
        let str = "Note: You can query transaction history within 1 year, with a maximum search period of 31 days."
        let noteLab = UILabel()
        noteLab.textColor = RGBCOLOR(r: 140, g: 151, b: 156)
        noteLab.setStyleLineSpacing(Text: str, Spacing: 2, alignment: .left)
        noteLab.font = FONT_M(size: 12)
        self.view.addSubview(noteLab)
        noteLab.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(fromTimeBtn.snp.bottom).offset(10)
        }
        
        let searchBtn = ZQButton()
        searchBtn.setTitle("Search", for: .normal)
        searchBtn.setGradMainColor(size: CGSize(width: SCREEN_WIDTH - 40, height: 40))
        searchBtn.corner(cornerRadius: 6)
        searchBtn.titleLabel?.font = FONT_M(size: 14)
        self.view.addSubview(searchBtn)
        searchBtn.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(40)
            make.top.equalTo(noteLab.snp.bottom).offset(30)
        }
        
        
        
    }

}


