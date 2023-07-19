//
//  MPMobileTopUpController.swift
//  MarketPlace
//
//  Created by mac on 2023/7/19.
//

import UIKit

class MPMobileTopUpController: BaseHiddenNaviController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Top up"
//        self.headerView.backgroundColor = RGBCOLOR(r: 68, g: 140, b: 58)
        self.headerView.backgroundColor = RGBCOLOR(r: 89, g: 160, b: 59)
        self.topViewLeftBtn.setImage(UIImage(named: "ic_back_family_Normal"), for: .normal)
        // Do any additional setup after loading the view.
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
