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
        
                       [["text":"internal transfer","img":"home_transferin_ic_Normal"],
                        ["text":"Quick transfer 247","img":"home_transferfast_ic_Normal"],
                        ["text":"Overseas remittance","img":"icTransfermoneyInternational_Normal"],
                        ["text":"External transfer","img":"home_transferout_ic_Normal"],
                        ["text":"Cash transfer","img":"home_transferreceivevcb_ic_Normal"],
                        ["text":"Lucky gift","img":"home_gift_ic_Normal"],
                        ["text":"Tranfer transaction status","img":"home_statusmoneyoder_ic_Normal"],
                        ["text":"Money service at VNPOST","img":"home_vnpost_ic_Normal"]],
                       
                       
                       [["text":"Electricity","img":""],
                        ["text":"Water","img":""],
                        ["text":"Post-paid mobile bill","img":""],
                        ["text":"Internet ADSL","img":""],
                        ["text":"Medical fees payment","img":""],
                        ["text":"Tuition fee","img":""],
                        ["text":"Logistic fee","img":""],
                        ["text":"VCB-Auto debit","img":""],
                        ["text":"Others","img":""]],
                        
                       
                       
                        [["text":"Top up","img":""],
                         ["text":"E-wallet topip","img":""],
                         ["text":"Topup agents","img":""],
                         ["text":"Topup traffic account","img":""],
                         ["text":"Auto Topup","img":""]],
                         
                       
                       
                       [["text":"Card list/Statement","img":""],
                        ["text":"Debit card renewal","img":""],
                        ["text":"Card issuance/conversion","img":""],
                        ["text":"Credit card payment","img":""],
                        ["text":"Instllment payment","img":""],
                        ["text":"Other card service","img":""]],
                       
                       
                       [["text":"Loan origination","img":""],
                        ["text":"Loan repayment","img":""],
                        ["text":"Loan settlement","img":""]],
                       
                       
                       [["text":"Online sabings","img":""],
                        ["text":"Flexible savings","img":""],
                        ["text":"Cumulative fixed deposit","img":""],
                        ["text":"Savings account for children","img":""],
                        ["text":"Automatic founds transfer","img":""]],
                       
                       
                       [["text":"Insurance fee","img":""],
                        ["text":"Bug insurance","img":""],
                        ["text":"Insurance contrace management","img":""]],
                       
                       
                       [["text":"Securities","img":""],
                        ["text":"Fund Certificates","img":""] ],
                       
                       [["text":"Social insurance","img":""],
                        ["text":"Port infrasyruceure fee payment","img":""],
                        ["text":"Pay registration fees","img":""]],
                       
                        
                       
                       [["text":"VnShop","img":""],
                        ["text":"Book fight","img":""],
                        ["text":"Book hotel","img":""],
                        ["text":"Book Taxi","img":""],
                        ["text":"Book bus ticket","img":""],
                        ["text":"Book flowers","img":""],
                        ["text":"Book train ticket","img":""],
                        ["text":"Book movie ticket","img":""]],
                       
                       [["text":"Clamin request","img":""],
                        ["text":"Setting Samart OTP","img":""],
                        ["text":"Set up transfer limit","img":""],
                        ["text":"VCB rewards","img":""],
                        ["text":"Promotions","img":""],
                        ["text":"Friend referral","img":""],
                        ["text":"VCB Family","img":""],
                        ["text":"Setup Account nickName","img":""],
                        ["text":"VCB Booking","img":""],
                        ["text":"Settings","img":""],
                        ["text":"Other utilities","img":""]]
                        
                   ]
    
    let itemWidth : CGFloat =  CGFloat(SCREEN_WIDTH - 4*20 - 20)/5
    let menuToolView = MPHomeToolsView.fromNib()
    
   
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
        
        
        //添加底部背景图
        let homeBgImage = UIImageView(frame: .zero)
        homeBgImage.image = UIImage(named: "homebg_1_Normal")
        homeBgImage.contentMode = .scaleAspectFill
        self.view.addSubview(homeBgImage)
        self.view.addSubview(tableView)
        
        
        //添加悬浮菜单
        menuToolView.backgroundColor = RGBCOLOR(r: 12, g: 24, b: 30)
        menuToolView.isHiddenTitle = true
        menuToolView.isHidden = true
        view.addSubview(menuToolView)
         
        
        tableView.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(88)
        }
        
        
        homeBgImage.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(100)
            
        }
        
        menuToolView.snp.makeConstraints { make in
            make.top.equalTo(88)
            make.left.right.equalTo(tableView)
            make.height.equalTo(itemWidth+20)
            
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
        return indexPath.section ==  9 ? 120 + allHeight: allHeight
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        let cell = tableView.dequeueReusableCell(withIdentifier: "MPHomeCell", for: indexPath) as! MPHomeCell
            cell.selectionStyle = .none
        cell.backgroundColor = UIColor.clear
        cell.dataSource = self.dataSource[indexPath.section]
        
        
        //模拟banner显示
        cell.topImageBanner.isHidden = indexPath.section != 9
        cell.bannerHieght.constant = indexPath.section == 9 ? 100 : 0
        cell.topImageBanner.image = UIImage(named: "7_Normal")
        cell.topImageBanner.IB_cornerRadius = 10
        
         return cell
  
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        
        let setionView = MPHomeSectionView.fromNib()
        setionView.bottomV.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        setionView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 23)
        
        let titleArray = ["Transfer","Bill payment","Topup","Card services","Credit","Savings","Insurance service","Investment","State budget","Shopping","Utilities"]
        setionView.titleName.text = titleArray[section]
        return setionView
    }
     
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return 23
    }
  
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let viewss = UIView()
//        viewss.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 10)
//        viewss.backgroundColor = .clear
//        return viewss
//    }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 10
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == tableView{
            let y = scrollView.contentOffset.y
            self.menuToolView.isHidden = y < 180 
        }
    }
    
}




