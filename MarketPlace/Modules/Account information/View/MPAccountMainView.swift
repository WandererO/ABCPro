//
//  MPAccountMainView.swift
//  MarketPlace
//
//  Created by 世文 on 2023/7/21.
//

import UIKit

class MPAccountMainView: UIView  {
    
    var searchMoreBlock:NormalBlock?
    var segmentClickBlock:SelectBlock?

    @IBOutlet weak var lineView: UIView!
  
    @IBOutlet weak var accountText: UITextField!
    @IBOutlet weak var amountText: UITextField!
    //数据源 * 行高
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    //数据列表
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var totalBtn: UIButton!
    @IBOutlet weak var inBtn: UIButton!
    @IBOutlet weak var outBtn: UIButton!
    
    @IBAction func listBtnAction(_ sender: UIButton) {
         
        print("按钮点击\(sender.tag)")
        UIView.animate(withDuration: 0.1) {
            self.lineView.centerX = sender.centerX
        }
        
        self.segmentClickBlock?(sender.tag)
        
    }
    
    @IBAction func moreClick(_ sender: Any) {
        self.searchMoreBlock?()
        
    }
    
    
    
    var recordeModel:[MPAccountModel] = [] {
        didSet{
            
            
            self.listTableView.reloadData()
        }
    }
    
    
    
    
    @IBOutlet weak var accountLab: UILabel!
    @IBOutlet weak var numberLab: UILabel!
    @IBOutlet weak var balanceLab: UILabel!
    
    @IBOutlet weak var detailBtn: UIButton!
    @IBOutlet weak var historyLab: UILabel!
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor(17, 34, 42, 0).withAlphaComponent(0.8)
        
        //嵌套不滚动
        self.listTableView.isScrollEnabled = false
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        self.listTableView.register(MPAccountTotalCell.self)
        self.listTableView.backgroundColor =  .clear
        
        self.tableViewHeight.constant = 4 * 65
        
        let account = Archive.getDefaultsForKey(key: "mobile")
        let amount = Archive.getDefaultsForKey(key: "money")
        
        accountText.text = account
        amountText.text = amount.getShowPrice() + "VND"
        
        
        accountLab.text = "Current account".localString()
        numberLab.text = "Account number".localString()
        balanceLab.text = "Available balance".localString()
        detailBtn.setTitle("Account details".localString(), for: .normal)
        historyLab.text = "Transaction history".localString()
        moreBtn.setTitle("Search more".localString(), for: .normal)
        totalBtn.setTitle("Total".localString(), for: .normal)
        inBtn.setTitle("Cash in".localString(), for: .normal)
        outBtn.setTitle("Cash out".localString(), for: .normal)
        
    }
}
extension MPAccountMainView : UITableViewDelegate , UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.recordeModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withType: MPAccountTotalCell.self, for: indexPath)
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.model = self.recordeModel[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MPTransactionDetailController()
        vc.model = self.recordeModel[indexPath.row]
        self.viewContainingController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
}

class MPSelectTimeButton : UIButton {
    
    var title : String? {
        set{
            timeLab.text = newValue
        }get{
            timeLab.text ?? ""
        }
    }
    
    
    let timeLab = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        timeLab.text = "22/06/2023"
        timeLab.textColor = kInputTextColor
        timeLab.font = FONT_M(size: 14)
        timeLab.textAlignment = .left
        self.addSubview(timeLab)
        timeLab.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.centerY.equalToSuperview()
        }
        
        let image = UIImageView()
        image.image = UIImage(named: "calandar_ic_Normal")
        self.addSubview(image)
        image.snp.makeConstraints { make in
            make.right.equalTo(-10)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
        }
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
