//
//  MPLoginnController.swift
//  MarketPlace
//
//  Created by mac on 2023/7/18.
//

import UIKit

class MPLoginnController: BaseHiddenNaviController {
    
    @IBOutlet weak var welcomeLab: UILabel!
    lazy var nameInput : MPTextField = {
        let put = MPTextField()
        put.keyboardType = .numberPad
        put.tintColor = .white
        put.placeText = "Username"
        put.operBtn.isHidden = true
        put.font = FONT_M(size: 16)
        put.textColor = RGBCOLOR(r: 82, g: 152, b: 59) 
        put.rx.controlEvent([.editingChanged]).asObservable().subscribe(onNext: {[weak self] _ in
            guard let self = self else{return}
//            if put.text?.isEmpty == false && self.psswdInput.text?.isEmpty == false {
//                self.loginBtn.isUserInteractionEnabled = true
//                self.loginBtn.backgroundColor = RGBCOLOR(r: 60, g: 116, b: 246)
//            }else{
//                self.loginBtn.isUserInteractionEnabled = false
//                self.loginBtn.backgroundColor = RGBCOLOR(r: 239, g: 243, b: 254)
//            }
            
        }).disposed(by: disposeBag)
        return put
    }()
    
    lazy var tipsLab : UILabel = {
        let lab = UILabel()
        lab.text = "(Enter the registered phone number)"
        lab.textColor = RGBCOLOR(r: 189, g: 189, b: 189)
        lab.font = FONT_R(size: 12)
        return lab
    }()
    
    lazy var nextBtn : ZQButton = {
        let btn = ZQButton()
        btn.backgroundColor = RGBCOLOR(r: 82, g: 152, b: 59)
        btn.corner(cornerRadius: 8)
        btn.setTitle("Continue", for: .normal)
        btn.titleLabel?.font = FONT_M(size: 16)
        btn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self = self else{return}
            let vc = MPPasswdController()
            self.navigationController?.pushViewController(vc, animated: true)
        }).disposed(by: disposeBag)
        return btn
    }()
    
    lazy var demoBtn : TitleImgButton = {
        let btn = TitleImgButton()
//        btn.leftImage = UIImage(named: "active_trial_ic_Normal")
        btn.rightImage = UIImage(named: "active_trial_arrow_ic_Normal")
        btn.title = "VCB Digibank demo version"
        btn.font = FONT_MONO_M(size: 16)
        btn.textColor = RGBCOLOR(r: 132, g: 188, b: 57)
        btn.imageWidth = 12
//        btn.imageMargin = 5
        btn.margin = 5
//        btn.rightImageWidth = 12
//        btn.leftImageWidth = 24
        return btn
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerView.isHidden = true

        // Do any additional setup after loading the view.
        
        self.view.addSubview(nameInput)
        nameInput.snp.makeConstraints { make in
            make.left.equalTo(50)
            make.right.equalTo(-40)
            make.height.equalTo(40)
            make.top.equalTo(welcomeLab.snp.bottom).offset(70)
        }
        
        self.view.addSubview(tipsLab)
        tipsLab.snp.makeConstraints { make in
            make.left.equalTo(40)
            make.top.equalTo(nameInput.snp.bottom).offset(8)
            make.height.equalTo(17)
        }
        
        self.view.addSubview(nextBtn)
        nextBtn.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.top.equalTo(tipsLab.snp.bottom).offset(30)
            make.height.equalTo(45)
        }
        
        self.view.addSubview(demoBtn)
        demoBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.top.equalTo(nextBtn.snp.bottom).offset(30)
        }
        
        
    }

}
