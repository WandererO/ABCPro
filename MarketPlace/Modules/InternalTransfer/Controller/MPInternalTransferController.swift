//
//  MPInternalTransferController.swift
//  MarketPlace
//
//  Created by mac on 2023/7/20.
//

import UIKit

class MPInternalTransferController: BaseHiddenNaviController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Internal transfer"
        self.headerView.backgroundColor = RGBCOLOR(r: 89, g: 160, b: 59)
        self.topViewLeftBtn.setImage(UIImage(named: "ic_back_family_Normal"), for: .normal)
        // Do any additional setup after loading the view.
    }

}
