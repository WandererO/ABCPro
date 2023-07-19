//
//  MPLoginController.swift
//  MarketPlace
//
//  Created by mac on 2023/7/16.
//

import UIKit

class MPLoginController: BaseHiddenNaviController {
    
    lazy var nameInput : MPTextField = {
        let put = MPTextField()
        put.placeText = "Username"
        put.operBtn.isHidden = true
        put.font = FONT_R(size: 20)
        put.textColor = RGBCOLOR(r: 62, g: 118, b: 246)
        put.rx.controlEvent([.editingChanged]).asObservable().subscribe(onNext: {[weak self] _ in
            guard let self = self else{return}
            if put.text?.isEmpty == false && self.psswdInput.text?.isEmpty == false {
                self.loginBtn.isUserInteractionEnabled = true
                self.loginBtn.backgroundColor = RGBCOLOR(r: 60, g: 116, b: 246)
            }else{
                self.loginBtn.isUserInteractionEnabled = false
                self.loginBtn.backgroundColor = RGBCOLOR(r: 239, g: 243, b: 254)
            }
            
        }).disposed(by: disposeBag)
        return put
    }()
    ///
    lazy var psswdInput : MPTextField = {
        let put = MPTextField()
        put.placeText = "Password"
        put.font = FONT_R(size: 20)
        put.isSecureText = true
        put.textColor = RGBCOLOR(r: 62, g: 118, b: 246)
        put.rx.controlEvent([.editingChanged]).asObservable().subscribe(onNext: {[weak self] _ in
            guard let self = self else{return}
            if put.text?.isEmpty == false && self.psswdInput.text?.isEmpty == false {
                self.loginBtn.isUserInteractionEnabled = true
                self.loginBtn.backgroundColor = RGBCOLOR(r: 60, g: 116, b: 246)
            }else{
                self.loginBtn.isUserInteractionEnabled = false
                self.loginBtn.backgroundColor = RGBCOLOR(r: 239, g: 243, b: 254)
            }
        }).disposed(by: disposeBag)
        return put
    }()
    
    lazy var loginBtn : ZQButton = {
        let btn = ZQButton()
        btn.setTitle("LOG IN", for: .normal)
        btn.backgroundColor = RGBCOLOR(r: 239, g: 243, b: 254)
        btn.setTitleColor(RGBCOLOR(r: 255, g: 255, b: 255), for: .normal)
        btn.corner(cornerRadius: 25)
        btn.titleLabel?.font = FONT_SB(size: 14)
        btn.isUserInteractionEnabled = false
        btn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self = self else{return}
//            btn.isSelected = !btn.isSelected
            print("登录")
        }).disposed(by: disposeBag)
        return btn
    }()
    
    lazy var forgetBtn : ZQButton = {
        let btn = ZQButton()
        btn.setTitle("Forgot your login information?", for: .normal)
        btn.setTitleColor(RGBCOLOR(r: 99, g: 110, b: 122), for: .normal)
        btn.titleLabel?.font = FONT_SB(size: 14)
        btn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self = self else{return}
//            btn.isSelected = !btn.isSelected
            let web = WebViewController()
            web.ignoreTitle = false
            web.urlStr = "https://dangkytructuyen.acb.com.vn/reset-account/password?language=vi"
            self.navigationController?.pushViewController(web, animated: true)
            print("忘记密码")
        }).disposed(by: disposeBag)
        return btn
    }()
    
    
    
    ///

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.title = "Login"
        self.topViewLeftBtn.setImage(UIImage(named: "ic_arrow_back"), for: .normal)
        self.imgae = UIImage(named: "ACBoneBlue")
        
        self.view.addSubview(nameInput)
        nameInput.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(160)
            make.height.equalTo(45)
        }
        
        self.view.addSubview(psswdInput)
        psswdInput.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(nameInput.snp.bottom).offset(30)
            make.height.equalTo(45)
        }
        
        self.view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(psswdInput.snp.bottom).offset(75)
            make.height.equalTo(55)
        }
        
        self.view.addSubview(forgetBtn)
        forgetBtn.snp.makeConstraints { make in
//            make.left.equalTo(20)
//            make.right.equalTo(-20)
            make.centerX.equalToSuperview()
            make.top.equalTo(loginBtn.snp.bottom).offset(30)
            make.height.equalTo(20)
        }
        
    }
    
    


}
