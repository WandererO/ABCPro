//
//  MPTransferSuccessController.swift
//  MarketPlace
//
//  Created by mac on 2023/8/16.
//

import UIKit

class MPTransferSuccessController: BaseHiddenNaviController {
    
    var model = MPTransferSuccessModel() {
        didSet{
            
//            let str = model.content
            ///换行
//            let resultStr = str.replacingOccurrences(of: "*", with: "\n")
            if model.bank.isEmpty == true {///没有银行名称则不显示
                self.dataAry = [["title":"Beneficiary name".localString(),"value":model.name],["title":"Beneficiary account".localString(),"value":model.account], ["title":"Transaction code".localString(), "value":model.code], ["title":"Content".localString(), "value":model.content], ["title":"Save transfer template".localString(), "value":""]]
            }else{
                self.dataAry = [["title":"Beneficiary name".localString(),"value":model.name],["title":"Beneficiary account".localString(),"value":model.account],["title":"Beneficiary bank".localString(), "value":model.bank],["title":"Transaction code".localString(), "value":model.code], ["title":"Content".localString(), "value":model.content], ["title":"Save transfer template".localString(), "value":""]]
            }
            
            
            
            tableHeaderView.amount = model.amount.getShowPrice() + " VND"
            tableHeaderView.times = model.time
            
//            self.tableView.reloadData()
        }
    }
    
    
    var dataAry:[[String:String]] = [] {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    let tableHeaderView = MPSuccessTableHeaderView()
    let tableFoot = MPTableFootView()
    lazy var tableView : BaseTableView = {
        
        let table = BaseTableView(frame: CGRect.zero, style: .plain)
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear//kMainBackgroundColor
        table.tableHeaderView = tableHeaderView
        table.tableFooterView = tableFoot
        table.tableFooterView?.height = 150
        table.tableHeaderView?.height = 240
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.estimatedRowHeight = 70
        table.register(UINib(nibName: "MPTranstionDetailCell", bundle: nil), forCellReuseIdentifier: "MPTranstionDetailCell")
        table.register(UINib(nibName: "MPSwichCell", bundle: nil), forCellReuseIdentifier: "MPSwichCell")
        table.autoresizingMask  = .flexibleHeight
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.headerView.isHidden = true
        // Do any additional setup after loading the view.
        //添加底部背景图
        let homeBgImage = UIImageView(frame: .zero)
        homeBgImage.image = UIImage(named: "homebg_1_Normal")
        homeBgImage.contentMode = .scaleAspectFill
        self.view.addSubview(homeBgImage)
        homeBgImage.snp.makeConstraints { make in
            make.left.top.bottom.right.equalToSuperview()
//            make.top.equalTo(48 + STATUSBAR_HIGH)
        }
        
        let bgView = UIView()
        bgView.backgroundColor = UIColor(17, 34, 42, 0).withAlphaComponent(0.8)
        self.view.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
//            make.top.equalTo(self.headerView.snp.bottom)
        }
        
        
        let homeBtn = ZQButton()
        homeBtn.setImage(UIImage(named: "ic_home_family_Normal"), for: .normal)
        view.addSubview(homeBtn)
        homeBtn.snp.makeConstraints { make in
            make.top.equalTo(SafeAreaTop + 10)
            make.right.equalTo(-20)
            make.width.height.equalTo(24)
        }
        
        
        
        let newBtn = ZQButton()
        newBtn.setTitle("New transaction".localString(), for: .normal)
        newBtn.titleLabel?.font = FONT_M(size: 16)
        newBtn.setGradMainColor(size: CGSize(width: SCREEN_WIDTH - 40, height: 45))
        newBtn.corner(cornerRadius: 12)
        view.addSubview(newBtn)
        newBtn.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(45)
            make.bottom.equalTo(-SafeAreaBottom)
        }
        newBtn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self = self else{return}
            self.navigationController?.popViewController(animated: true)
        }).disposed(by: disposeBag)
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(TOP_HEIGHT)
            make.bottom.equalTo(newBtn.snp.top).offset(-10)
        }
        
        
    }

}

extension MPTransferSuccessController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataAry.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if dataAry.count == 5 {
            if indexPath.row == 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MPSwichCell", for: indexPath) as! MPSwichCell
                cell.selectionStyle = .none
                return cell
            }
        }else {
            if indexPath.row == 5 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MPSwichCell", for: indexPath) as! MPSwichCell
                cell.selectionStyle = .none
                return cell
            }
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "MPTranstionDetailCell", for: indexPath) as! MPTranstionDetailCell
        cell.selectionStyle = .none
        cell.dict = dataAry[indexPath.row]
        return cell
        
    }

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
}
