//
//  LoginController.swift
//  MarketPlace
//
//  Created by XXX on 6/10/22.
//

import UIKit
import RxSwift
import AuthenticationServices
import SwiftyRSA

class CCLoginController: BaseHiddenNaviController {
    
    lazy var nameInput : MPTextField = {
        let put = MPTextField()
        put.placeText = "Username"
        put.operBtn.isHidden = true
        put.font = FONT_R(size: 20)
        put.textColor = RGBCOLOR(r: 62, g: 118, b: 246)
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
    
    
    override func topLeftBtnClick() {
        self.dismiss(animated: true)
//        NotificationCenter.default.post(name: loginSuccessNotification, object: self)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        NotificationCenter.default.removeObserver(self)
    }

}


extension CCLoginController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

//        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.isHidden = true
//        self.reloadGoogle()
    }
}






