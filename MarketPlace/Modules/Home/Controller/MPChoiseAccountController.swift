//
//  MPChoiseAccountController.swift
//  MarketPlace
//
//  Created by mac on 2023/7/21.
//

import UIKit

class MPChoiseAccountController: BaseHiddenNaviController {
    
    lazy var scrollV = UIScrollView()
    
    lazy var closeBtn : ZQButton = {
        let btn = ZQButton()
        btn.setImage(UIImage(named: "account_close_ic_Normal"), for: .normal)
        btn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self = self else{return}
            self.dismiss(animated: true)
        }).disposed(by: disposeBag)
        return btn
    }()
    
    lazy var segmentView : SegmentView = {
        let seg = SegmentView()
        seg.titles = ["Account".localString() , "Card".localString()]
        seg.segmentedViewDataSource.titleNormalColor = RGBCOLOR(r: 168, g: 168, b: 168)
        seg.segmentedViewDataSource.titleSelectedColor = RGBCOLOR(r: 0, g: 0, b: 0)
        seg.segmentedViewDataSource.titleSelectedFont = FONT_M(size: 16)
        seg.segmentedViewDataSource.titleNormalFont = FONT_M(size: 16)
        seg.segmentedViewDataSource.isItemSpacingAverageEnabled = true
        seg.isShowBottomLine = false
        seg.lineView.indicatorColor = kInputTextColor
        seg.lineView.indicatorWidth = 120
        seg.clickAt = { [weak self] row in
            guard let self = self else{return}
            if row == 0 {
                
            }else{
                
            }
        }
        return seg
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerView.isHidden = true
        // Do any additional setup after loading the view.
        setUI()
        
        self.view.corner(cornerRadius: 15)
    }
    
    func setUI() {
        
        
        
        self.view.addSubview(closeBtn)
        closeBtn.snp.makeConstraints { make in
            make.right.equalTo(-20)
            make.top.equalTo(15)
        }
        self.view.addSubview(segmentView)
        segmentView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(70)
            make.height.equalTo(40)
        }
        
        
        self.view.addSubview(scrollV)
        scrollV.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(segmentView.snp.bottom).offset(10)
            make.width.equalTo(SCREEN_WIDTH)
            make.bottom.equalToSuperview()
        }
        
        let bezierV = MPBezierView()
        scrollV.addSubview(bezierV)
        bezierV.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH)
            make.top.equalTo(10)
            make.height.equalTo(600)
        }
        
        let updateBtn = ZQButton()
        updateBtn.setImageAndTitle(NormalImageName: "group_Normal", SelectImageName: "", title: "Update balance", type: .Positionleft, Space: 5)
        updateBtn.titleLabel?.font = FONT_M(size: 12)
        updateBtn.backgroundColor = RGBCOLOR(r: 244, g: 248, b: 237)
        updateBtn.setTitleColor(kInputTextColor, for: .normal)
        updateBtn.corner(cornerRadius: 14)
        scrollV.addSubview(updateBtn)
        updateBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bezierV.snp.bottom).offset(10)
            make.height.equalTo(30)
            make.width.equalTo(150)
        }
        
        
        let currentV = MPCurrentAccountView()
        currentV.corner(cornerRadius: 12)
        scrollV.addSubview(currentV)
        currentV.setGradMainColor(size:CGSize(width: SCREEN_WIDTH - 40, height: 120))
        currentV.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(updateBtn.snp.bottom).offset(30)
            make.width.equalTo(SCREEN_WIDTH - 40)
            make.height.equalTo(120)
//            make.bottom.equalTo(30)
        }
        
        let accountV = MPAccountNumView()
        accountV.corner(cornerRadius: 12, borderColor: RGBCOLOR(r: 203, g: 225, b: 131), borderWidth: 1)
        scrollV.addSubview(accountV)
        accountV.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.width.equalTo(SCREEN_WIDTH - 40)
            make.height.equalTo(120)
            make.top.equalTo(currentV.snp.bottom).offset(10)
            make.bottom.equalTo(-30)
        }
        accountV.pushBlock = {[weak self] in
            guard let self = self else{return}
            self.dismiss(animated: true) {
                let vc = MPAccountInfomationVC(nibName: "MPAccountInfomationVC", bundle: nil)
                CommonUtil.getCurrentVC()?.pushViewController(vc: vc, animate: true)
            }
        }
        
    }
}

extension MPChoiseAccountController {
    func show(on VC : UIViewController , height : CGFloat){
        
        var configuration = NBBottomSheetConfiguration(sheetSize: .fixed(height))
        configuration.backgroundViewColor = RGBCOLOR(r: 18, g: 31, b: 37)//UIColor.black.withAlphaComponent(0.5)
        configuration.animationDuration = 0.5
        let bottomSheetController = NBBottomSheetController(configuration: configuration)
        bottomSheetController.present(self, on: VC)
    }
}

class MPCurrentAccountView : BaseView {
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let account = Archive.getDefaultsForKey(key: "mobile")
        let amount = Archive.getDefaultsForKey(key: "money").getShowPrice()
        
        let bgView = UIView()
        bgView.backgroundColor = RGBCOLOR(r: 46, g: 106, b: 60)
        bgView.corner(cornerRadius: 14)
        self.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(10)
            make.height.equalTo(30)
        }
        
        let currentLab = UILabel()
        currentLab.text = "Current account"
        currentLab.textColor = .white
        currentLab.font = FONT_M(size: 14)
        bgView.addSubview(currentLab)
        currentLab.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.centerY.equalToSuperview()
        }
        
        let numLab = UILabel()
        numLab.text = "1"
        numLab.textColor = .white
        numLab.textAlignment = .center
        numLab.font = FONT_M(size: 12)
        numLab.corner(cornerRadius: 7)
        numLab.backgroundColor = RGBCOLOR(r: 119, g: 201, b: 113)
        bgView.addSubview(numLab)
        numLab.snp.makeConstraints { make in
            make.left.equalTo(currentLab.snp.right).offset(5)
            make.right.equalTo(-10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(14)
        }
        
        let totalTip = UILabel()
        totalTip.text = "Total available balance"
        totalTip.textColor = RGBCOLOR(r: 242, g: 255, b: 236)
        totalTip.font = FONT_M(size: 14)
        self.addSubview(totalTip)
        totalTip.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(bgView.snp.bottom).offset(20)
        }
        let lineV = UIView()
        lineV.backgroundColor = kInputTextColor
        self.addSubview(lineV)
        lineV.snp.makeConstraints { make in
            make.centerY.equalTo(totalTip.snp.centerY)
            make.left.equalTo(totalTip.snp.right).offset(20)
            make.right.equalTo(-20)
            make.height.equalTo(1)
        }
        
        let amountLab = UILabel()
        amountLab.text = amount + "VND"
        amountLab.textColor = .white//RGBCOLOR(r: 242, g: 255, b: 236)
        amountLab.font = FONT_M(size: 14)
        self.addSubview(amountLab)
        amountLab.snp.makeConstraints { make in
            make.right.equalTo(-20)
            make.bottom.equalTo(-20)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MPAccountNumView : BaseView {
    
    
    var pushBlock:NormalBlock?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.isUserInteractionEnabled = true
        
        self.addTapForView().subscribe(onNext: { [weak self] _ in
            guard let self = self else{return}
            print("+++++++++")
            self.pushBlock?()
            
            
        }).disposed(by: disposeBag)
        
        setUI()
    }
    
    func setUI() {
        
        let account = Archive.getDefaultsForKey(key: "mobile")
        let amount = Archive.getDefaultsForKey(key: "money").getShowPrice()
        
        let titleLab = UILabel()
        titleLab.text = "Account number"
        titleLab.textColor = RGBCOLOR(r: 168, g: 168, b: 168)
        titleLab.font = FONT_M(size: 14)
        self.addSubview(titleLab)
        titleLab.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(20)
        }
        
        let numLab = UILabel()
        numLab.text = account
        numLab.textColor = .black
        numLab.font = FONT_SB(size: 14)
        self.addSubview(numLab)
        numLab.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(titleLab.snp.bottom).offset(5)
        }
        
        let copyBtn = ZQButton()
        copyBtn.setImage(UIImage(named: "copy_ic_Normal"), for: .normal)
        self.addSubview(copyBtn)
        copyBtn.snp.makeConstraints { make in
            make.left.equalTo(numLab.snp.right).offset(10)
            make.top.equalTo(titleLab.snp.bottom).offset(8)
            make.height.width.equalTo(12)
        }
        
        let iconBtn = ZQButton()
        iconBtn.setImage(UIImage(named: "arrow_left_ic_Normal"), for: .normal)
        iconBtn.backgroundColor = RGBCOLOR(r: 203, g: 225, b: 131)
        self.addSubview(iconBtn)
        iconBtn.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview()
            make.width.equalTo(20)
        }
        
        let amountLab = UILabel()
        amountLab.text = amount + "VND"
        amountLab.textColor = kInputTextColor
        amountLab.font = FONT_SB(size: 16)
        self.addSubview(amountLab)
        amountLab.snp.makeConstraints { make in
            make.right.equalTo(iconBtn.snp.left).offset(-20)
            make.bottom.equalTo(-20)
        }
        
        let availableLab = UILabel()
        availableLab.text = "Available balance"
        availableLab.textColor = RGBCOLOR(r: 168, g: 168, b: 168)
        availableLab.font = FONT_M(size: 14)
        self.addSubview(availableLab)
        availableLab.snp.makeConstraints { make in
            make.right.equalTo(iconBtn.snp.left).offset(-20)
            make.bottom.equalTo(amountLab.snp.top).offset(-5)
        }
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
