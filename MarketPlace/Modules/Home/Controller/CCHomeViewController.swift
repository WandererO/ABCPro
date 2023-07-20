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
    
    let dataSource = [
        
                       [["text":"internal transfer","img":"home_transferin_ic_Normal"],["text":"Quick transfer 247","img":"home_transferfast_ic_Normal"],["text":"Overseas remittance","img":"icTransfermoneyInternational_Normal"],["text":"External transfer","img":"home_transferout_ic_Normal"],["text":"Cash transfer","img":"home_transferreceivevcb_ic_Normal"],["text":"Lucky gift","img":"home_gift_ic_Normal"],["text":"Tranfer transaction status","img":"home_statusmoneyoder_ic_Normal"],["text":"Money service at VNPOST","img":"home_vnpost_ic_Normal"]],
                       
                       [["text":"","img":""],["text":"","img":""],["text":"","img":""],["text":"","img":""]],
                        
                        [["text":"","img":""],["text":"","img":""],["text":"","img":""],["text":"","img":""]],
                         
                       [["text":"","img":""],["text":"","img":""],["text":"","img":""],["text":"","img":""]],
                        
                        
                   ]
                         
    let tableHeader = MPHomesHeaderView.fromNib()
    lazy var tableView : BaseTableView = {
        let table = BaseTableView(frame: CGRect.zero, style: .grouped)
        tableHeader.backgroundColor = .clear
        table.tableHeaderView = tableHeader
        table.showsVerticalScrollIndicator = false
        //tableView 背景色
        table.backgroundColor =  UIColor(17, 34, 42, 0).withAlphaComponent(0.8)
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.separatorColor = .clear
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
        
        let homeBgImage = UIImageView(frame: .zero)
        homeBgImage.image = UIImage(named: "homebg_1_Normal")
        homeBgImage.contentMode = .scaleAspectFill
        self.view.addSubview(homeBgImage)
        
        self.view.addSubview(tableView)
        
        
       
        
        tableView.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(88)
        }
        
        
        homeBgImage.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(100)
            
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    
    
}

extension CCHomeViewController : UITableViewDataSource , UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //需要动态返回高度，根据数组里面的count 计算有几行 * 高度
        let arr = dataSource[indexPath.section]
        let itemHeight : CGFloat = (SCREEN_WIDTH/3)
        let columnCount = Int(ceilf(Float(arr.count) * 1.0 / 3))
        let allHeight  = CGFloat(columnCount) * itemHeight
        print(allHeight)
        return indexPath.section == 2 ? 150 + allHeight: allHeight
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        let cell = tableView.dequeueReusableCell(withIdentifier: "MPHomeCell", for: indexPath) as! MPHomeCell
            cell.selectionStyle = .none
        cell.backgroundColor = UIColor.clear
        cell.dataSource = self.dataSource[indexPath.section]
        //模拟banner显示
        cell.topImageBanner.isHidden = indexPath.section != 2
        cell.bannerHieght.constant = indexPath.section == 2 ? 150 : 0
        
         return cell
  
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        
        let setionView = MPHomeSectionView.fromNib()
        setionView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 30)
        setionView.titleName.text = "这是第\(section)行"
        return setionView
    }
     
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return 30
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}




