//
//  MPPublicViewModel.swift
//  MarketPlace
//
//  Created by mac on 2023/7/25.
//

import UIKit

class MPPublicViewModel: NSObject {
    
    var loginModel = CCLoginModel()
    func requestLogin(account:String, psswd:String)->(PublishSubject<Any>) {
        let dataSubject = PublishSubject<Any>()
        NetWorkRequest(RequestEnum.login(account: account, password: psswd), modelType: CCLoginModel.self) { model in
            
            if let model = model as? CCLoginModel {
                self.loginModel = model
                dataSubject.onNext(true)
            }

        } failureCallback: { code, message in
            
            dataSubject.onError(NSError(domain: message, code: code))
            print("\(code)")
            HudManager.showOnlyText("登录失败")
        }
        return dataSubject
    }

}
