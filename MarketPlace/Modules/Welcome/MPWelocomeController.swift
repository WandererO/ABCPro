//
//  MPWelocomeController.swift
//  MarketPlace
//
//  Created by mac on 2023/7/15.
//

import UIKit

class MPWelocomeController: BaseHiddenNaviController {

    @IBOutlet weak var bgImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerView.isHidden = true
        // Do any additional setup after loading the view.
        
        let OtpBtn = WelcomeButtonView()
        OtpBtn.title = "Get OTP"
        OtpBtn.image = UIImage(named: "ic_privacy")
        bgImageView.addSubview(OtpBtn)
        OtpBtn.snp.makeConstraints { make in
            make.bottom.equalTo(-40)
            make.left.equalTo(20)
            make.height.equalTo(40)
//            make.width.equalTo(100)
        }
        OtpBtn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self = self else{return}
        }).disposed(by: disposeBag)
        
        let registerBtn = WelcomeButtonView()
        registerBtn.title = "Register"
        registerBtn.image = UIImage(named: "ic_register1")
        bgImageView.addSubview(registerBtn)
        registerBtn.snp.makeConstraints { make in
            make.bottom.equalTo(-40)
            make.right.equalTo(-20)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        registerBtn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self = self else{return}
        }).disposed(by: disposeBag)
    }

    @IBAction func loginClick(_ sender: Any) {
//        let vc = MPLoginController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}

