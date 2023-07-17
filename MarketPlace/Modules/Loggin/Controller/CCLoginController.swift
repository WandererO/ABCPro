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






