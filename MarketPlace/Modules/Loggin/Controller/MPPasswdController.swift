//
//  MPPasswdController.swift
//  MarketPlace
//
//  Created by mac on 2023/7/19.
//

import UIKit

class MPPasswdController: BaseHiddenNaviController {

    @IBOutlet weak var tipsLab: UILabel!
    
    let loginVM = MPPublicViewModel()
    
    var account = ""
    
    lazy var nameInput : MPTextField = {
        let put = MPTextField()
        put.keyboardType = .asciiCapable
        put.tintColor = .white
        put.placeText = "Psaaword"
        put.operBtn.isHidden = false
        put.isSecureText = true
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
    
    lazy var nextBtn : ZQButton = {
        let btn = ZQButton()
        btn.backgroundColor = RGBCOLOR(r: 82, g: 152, b: 59)
        btn.corner(cornerRadius: 8)
        btn.setTitle("Continue", for: .normal)
        btn.titleLabel?.font = FONT_M(size: 16)
        btn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self = self else{return}
            
            self.requestLogin()
            
        }).disposed(by: disposeBag)
        return btn
    }()
    
    lazy var forgetBtn : ZQButton = {
        let btn = ZQButton()
        btn.corner(cornerRadius: 8)
        btn.setTitle("Forgot password?", for: .normal)
        btn.titleLabel?.font = FONT_M(size: 14)
        btn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self = self else{return}
            
        }).disposed(by: disposeBag)
        return btn
    }()
    
    func requestLogin() {
        
        if nameInput.text?.isEmpty == true {
            HudManager.showOnlyText("请输入密码")
            return
        }
        
        
        let pssword = nameInput.text ?? ""
        loginVM.requestLogin(account: account, psswd: pssword).subscribe(onNext: {[weak self] _ in
            guard let self = self else {return}
            Archive.setDefaults(value: account, key: "account")
            Archive.setDefaults(value: pssword, key: "password")
            
            
            let token = loginVM.loginModel.userinfo?.token ?? ""
            let money = loginVM.loginModel.userinfo?.money ?? ""
            let account = loginVM.loginModel.userinfo?.mobile ?? ""
            Archive.setDefaults(value: account, key: "mobile")
            Archive.setDefaults(value: money, key: "money")
            Archive.saveToken(token)
            
            NotificationCenter.default.post(name: loginSuccessNotification, object: self)
        }).disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.headerView.isHidden = true

        self.view.addSubview(nameInput)
        nameInput.snp.makeConstraints { make in
            make.left.equalTo(50)
            make.right.equalTo(-40)
            make.height.equalTo(40)
            make.top.equalTo(tipsLab.snp.bottom).offset(80)
        }
        
        self.view.addSubview(nextBtn)
        nextBtn.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.top.equalTo(nameInput.snp.bottom).offset(20)
            make.height.equalTo(45)
        }
        
        self.view.addSubview(forgetBtn)
        forgetBtn.snp.makeConstraints { make in
//            make.left.equalTo(15)
//            make.right.equalTo(-15)
            make.centerX.equalToSuperview()
            make.top.equalTo(nextBtn.snp.bottom).offset(20)
//            make.height.equalTo(45)
        }
        
         
        // Do any additional setup after loading the view.
    }

    @IBAction func backClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
