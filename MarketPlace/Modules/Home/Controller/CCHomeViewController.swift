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
                       
                       
                       [["text":"Electricity","img":"home_electricitybills_ic_Normal"],
                        ["text":"Water","img":"home_water_ic_Normal"],
                        ["text":"Post-paid mobile bill","img":"ic_bill_extend_card_Normal"],
                        ["text":"Internet ADSL","img":"home_adslinternetfee_ic_Normal"],
                        ["text":"Medical fees payment","img":"home_hospitalbill_ic_Normal"],
                        ["text":"Tuition fee","img":"home_schoolfee_ic_Normal"],
                        ["text":"Logistic fee","img":"home_logisticfee_ic_Normal"],
                        ["text":"VCB-Auto debit","img":"home_registerautodebit_ic_Normal"],
                        ["text":"Others","img":"home_more_ic_Normal"]],
                        
                       
                       
                        [["text":"Top up","img":"home_topup_ic_Normal"],
                         ["text":"E-wallet topip","img":"home_electronictopup_ic_Normal"],
                         ["text":"Topup agents","img":"home_topupagent_ic_Normal"],
                         ["text":"Topup traffic account","img":"home_vetctopup_ic_Normal"],
                         ["text":"Auto Topup","img":"home_autovetctopup_ic_Normal"]],
                         
                       
                       
                       [["text":"Card list/Statement","img":"hime_statement_ic_Normal"],
                        ["text":"Debit card renewal","img":"home_edc_ic_Normal"],
                        ["text":"Card issuance/conversion","img":"home_cardchip_ic_Normal"],
                        ["text":"Credit card payment","img":"home_paycredit_ic_Normal"],
                        ["text":"Instllment payment","img":"home_installment_Normal"],
                        ["text":"Other card service","img":"home_more_ic_Normal"]],
                       
                       
                       [["text":"Loan origination","img":"home_openloan_ic_Normal"],
                        ["text":"Loan repayment","img":"home_payment_loan_ic_Normal"],
                        ["text":"Loan settlement","img":"home_closeloan_ic_Normal"]],
                       
                       
                       [["text":"Online sabings","img":"home_loan_online_ic_Normal"],
                        ["text":"Flexible savings","img":"home_flex_saving_ic_Normal"],
                        ["text":"Cumulative fixed deposit","img":"home_deposit_ic_Normal"],
                        ["text":"Savings account for children","img":"ic_home_kidsaving_Normal"],
                        ["text":"Automatic founds transfer","img":"home_registerautosaving_ic_Normal"]],
                       
                       
                       [["text":"Insurance fee","img":"home_fwdbill_ic_Normal"],
                        ["text":"Bug insurance","img":"home_buy_insurance_fwd_ic_Normal"],
                        ["text":"Insurance contrace management","img":""]],
                       
                       
                       [["text":"Securities","img":"home_stock_ic_Normal"],
                        ["text":"Fund Certificates","img":"icStockaddWhite38X38_Normal"] ],
                       
                       
                       
                       [["text":"Social insurance","img":"home_insurancebill_Normal"],
                        ["text":"Port infrasyruceure fee payment","img":"home_fee_seaport_ic_Normal"],
                        ["text":"Pay registration fees","img":"icTax2White38X38_Normal"]],
                       
                        
                       
                       [["text":"VnShop","img":"vnshop_ic_Normal"],
                        ["text":"Book fight","img":"home_bookflight_ic_Normal"],
                        ["text":"Book hotel","img":"home_hotel_ic_Normal"],
                        ["text":"Book Taxi","img":"icHomeTaxi17Pt_Normal"],
                        ["text":"Book bus ticket","img":"icHomeTaxi17Pt_Normal"],
                        ["text":"Book flowers","img":"home_flower_ic_Normal"],
                        ["text":"Book train ticket","img":"home_train_ic_Normal"],
                        ["text":"Book movie ticket","img":"home_film_ic_Normal"]],
                       
                       [["text":"Clamin request","img":"home_check_online_ic_Normal"],
                        ["text":"Setting Samart OTP","img":"home_active_soft_ic_Normal"],
                        ["text":"Set up transfer limit","img":"home_limittrans_ic_Normal"],
                        ["text":"VCB rewards","img":"ic_home_reward_Normal"],
                        ["text":"Promotions","img":"home_promotion_ic_Normal"],
                        ["text":"Friend referral","img":"home_ic_gioithieuban_Normal"],
                        ["text":"VCB Family","img":""],
                        ["text":"Setup Account nickName","img":"home_issuechipcard_ic_Normal"],
                        ["text":"VCB Booking","img":"home_appointment_ic_Normal"],
                        ["text":"Settings","img":"home_setting_ic_Normal"],
                        ["text":"Other utilities","img":"home_more_ic_Normal"]]
                        
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




