//
//  CCOTCViewController.swift
//  MarketPlace
//
//  Created by mac on 2023/3/9.
//

import UIKit

class CCOTCViewController: BaseHiddenNaviController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        // Do any additional setup after loading the view.
    }

}

extension CCOTCViewController {
    func setUI() {
        
        let topNavView = OTCTopView()
        self.headerView.addSubview(topNavView)
        topNavView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        }
        
    }
}
