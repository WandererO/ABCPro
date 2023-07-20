//
//  CCHomeViewController.swift
//  MarketPlace
//
//  Created by XXX on 6/8/22.
//

import UIKit
import RxSwift
import SafariServices
//import ZendeskSDK
//import ZendeskSDKMessaging


class CCHomeViewController: BaseHiddenNaviController {
    
//    let tableHeader = MPHomeHeaderView()
    let tableHeader = MPHomesHeaderView.fromNib()
    lazy var tableView : BaseTableView = {
        
        let table = BaseTableView(frame: CGRect.zero, style: .plain)
      
        table.tableHeaderView = tableHeader
//        table.tableHeaderView?.height = 300//tableViewHeader.headerHight
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = kMainBackgroundColor
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.register(UINib(nibName: "MPHomeCell", bundle: nil), forCellReuseIdentifier: "MPHomeCell")
        table.autoresizingMask  = .flexibleHeight
        if #available(iOS 15.0, *) {
            table.sectionHeaderTopPadding = 0
        }
        return table
    }()

}
extension CCHomeViewController{
    
    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
            
           reloadHeaderView()
           
       }
    
    func reloadHeaderView(){
        if let header = tableView.tableHeaderView {
            /// 前提是xib中设置好约束  设置tableView.tableHeaderView高度
            let height = tableView.tableHeaderView?.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            var frame = tableView.tableHeaderView?.frame
            frame?.size.height = height!
            print(height ?? 0)
            
            tableView.tableHeaderView?.frame = frame!
            tableView.tableHeaderView = header
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.imgae = UIImage(named:"home_navbar_logo_Normal")
        self.headerView.backgroundColor = RGBCOLOR(r: 89, g: 160, b: 59)
        
        self.topViewLeftBtn.titleLabel?.font = FONT_M(size: 16)
        self.topViewLeftBtn.setImageAndTitle(NormalImageName: "home_nav_logout_ic_Normal", SelectImageName: "", title: "Exit", type: .Positionleft, Space: 5)
        
        self.topViewRightBtn.setImage(UIImage(named: "login_notify_ic_Normal"), for: .normal)
        self.topRightTwoBtn.setImage(UIImage(named: "ic_home_search_Normal"), for: .normal)
        self.topRightTwoBtn.isHidden = false
        
        setUI()
    }
    
    func setUI(){
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(88)
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    
    
}

extension CCHomeViewController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if exchangeRate == false {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MPHomeCell", for: indexPath) as! MPHomeCell
            cell.selectionStyle = .none
//            cell.model = self.marketViewModel.marketListModels[indexPath.row]
            return cell
//        }else{
//            let cell = tableView.dequeueReusableCell(withIdentifier: "MPHome24hExchangeCell", for: indexPath) as! MPHome24hExchangeCell
//            cell.selectionStyle = .none
//            cell.model = self.marketViewModel.marketListModels[indexPath.row]
//            return cell
//        }
        
    }
    
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        return self.sectionView
//    }
     
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//
//        return 80
//    }
//
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}




