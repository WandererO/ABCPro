//
//  MPTransactionDetailController.swift
//  MarketPlace
//
//  Created by mac on 2023/7/23.
//

import UIKit

class MPTransactionDetailController: BaseHiddenNaviController {
    
    
    
    
    var dataAry:[[String:String]] = [] {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    lazy var tableView : BaseTableView = {
        
        let table = BaseTableView(frame: CGRect.zero, style: .plain)
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear//kMainBackgroundColor
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.estimatedRowHeight = 70
        table.register(UINib(nibName: "MPTranstionDetailCell", bundle: nil), forCellReuseIdentifier: "MPTranstionDetailCell")
        table.autoresizingMask  = .flexibleHeight
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Transaction details"
        self.topViewLeftBtn.setImage(UIImage(named: "ic_back_family_Normal"), for: .normal)
        self.topViewRightBtn.setImage(UIImage(named: "ic_home_family_Normal"), for: .normal)
        
        //添加底部背景图
        let homeBgImage = UIImageView(frame: .zero)
        homeBgImage.image = UIImage(named: "homebg_1_Normal")
        homeBgImage.contentMode = .scaleAspectFill
        self.view.addSubview(homeBgImage)
        homeBgImage.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(48 + STATUSBAR_HIGH)
        }
        
        let bgView = UIView()
        bgView.backgroundColor = UIColor(17, 34, 42, 0).withAlphaComponent(0.8)
        self.view.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.headerView.snp.bottom)
        }
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.headerView.snp.bottom)
        }
        
        let str = "MBVCB.3888458237.0*47326.VU DANG TUNG*chuyen tien.CT tu"
        ///换行
        let resultStr = str.replacingOccurrences(of: "*", with: "\n")
        
        self.dataAry = [["title":"Transaction number","value":"5275 - 20678"],["title":"Transaction date","value":"20/07/2023"],["title":"Transaction amount", "value":"100000"],["title":"Transaction content", "value":resultStr]]

        
    }


}

extension MPTransactionDetailController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataAry.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "MPTranstionDetailCell", for: indexPath) as! MPTranstionDetailCell
        cell.selectionStyle = .none
        cell.dict = dataAry[indexPath.row]
        return cell
        
    }

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
}
