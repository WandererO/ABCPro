//
//  MPTransactionHistoryController.swift
//  MarketPlace
//
//  Created by mac on 2023/7/23.
//

import UIKit

class MPTransactionHistoryController: BaseHiddenNaviController {
    
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var startTimeBtn: UIButton!
    @IBOutlet weak var endTimeBtn: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var endTimeLab: UILabel!
    @IBOutlet weak var startTimeLab: UILabel!
    @IBOutlet weak var lineView: UIView!
     
    @IBOutlet weak var listTableView: UITableView!
 
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var topHeight: NSLayoutConstraint!
    
    var startTime = ""
    var endTime  = ""
    var isStartTime = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Transaction history"
        self.topViewLeftBtn.setImage(UIImage(named: "ic_back_family_Normal"), for: .normal)
        
        topHeight.constant = NAV_HIGH + 20
        
        bgView.backgroundColor = UIColor(17, 34, 42, 0).withAlphaComponent(0.8)
       //渐变背景
        searchButton.setGradMainColor(size: CGSize(width: SCREEN_WIDTH-40, height: 40))
        //嵌套不滚动
        self.listTableView.isScrollEnabled = false
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        self.listTableView.register(MPAccountTotalCell.self)
        self.listTableView.backgroundColor =  .clear
        //动态高度
        tableViewHeight.constant = 65*20
        searchButton.IB_cornerRadius = 10
        
        
        startTime = String.getLastMonth(num: -1)
        endTime = String.getCurrentSysDate()
        
        endTimeLab.text = endTime
        startTimeLab.text = startTime
    }

  
    
    //搜索按钮
    @IBAction func sarchButtonAction(_ sender: Any) {

    }
    
    //菜单选择
    @IBAction func buttonAction(_ sender: UIButton) {
        
        
        UIView.animate(withDuration: 0.1) {
            self.lineView.centerX = sender.centerX
        }
        
        
        
        
    }
    
    @IBAction func startTimeClick(_ sender: Any) {
        print("开始时间")
        popDatePicker()
        isStartTime = true
    }
    
    @IBAction func endTimeClick(_ sender: Any) {
        print("结束时间")
        isStartTime = false
    }
    
    func popDatePicker() {
        let pop = MPDatePickView()
        pop.show()
        pop.pickerTimeBlock = {[weak self] timeStr in
            guard let self = self else{return}
            if isStartTime == true {
                startTimeLab.text = timeStr
            }else{
                endTimeLab.text = timeStr
            }
        }
    }
    
    func setUI(){
//        self.view.addSubview(fromTimeBtn)
//        self.view.addSubview(toTimeBtn)
//        [fromTimeBtn, toTimeBtn].snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: 15, leadSpacing: 20, tailSpacing: 20)
//        [fromTimeBtn, toTimeBtn].snp.makeConstraints { make in
//            make.top.equalTo(headerView.snp.bottom).offset(30)
//            make.height.equalTo(40)
//        }
//
//        let str = "Note: You can query transaction history within 1 year, with a maximum search period of 31 days."
//        let noteLab = UILabel()
//        noteLab.textColor = RGBCOLOR(r: 140, g: 151, b: 156)
//        noteLab.setStyleLineSpacing(Text: str, Spacing: 2, alignment: .left)
//        noteLab.font = FONT_M(size: 12)
//        self.view.addSubview(noteLab)
//        noteLab.snp.makeConstraints { make in
//            make.left.equalTo(20)
//            make.right.equalTo(-20)
//            make.top.equalTo(fromTimeBtn.snp.bottom).offset(10)
//        }
//
//        let searchBtn = ZQButton()
//        searchBtn.setTitle("Search", for: .normal)
//        searchBtn.setGradMainColor(size: CGSize(width: SCREEN_WIDTH - 40, height: 40))
//        searchBtn.corner(cornerRadius: 6)
//        searchBtn.titleLabel?.font = FONT_M(size: 14)
//        self.view.addSubview(searchBtn)
//        searchBtn.snp.makeConstraints { make in
//            make.left.equalTo(20)
//            make.right.equalTo(-20)
//            make.height.equalTo(40)
//            make.top.equalTo(noteLab.snp.bottom).offset(30)
//        }
//
//
        
    }

}

extension MPTransactionHistoryController : UITableViewDelegate , UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 65
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withType: MPAccountTotalCell.self, for: indexPath)
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        cell.moeny.textColor = indexPath.row == 0 ? .red: UIColor(173, 208, 65, 1)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MPTransactionDetailController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

class MPDatePickView : BaseView {
    
    var pickerTime = ""
    
    var pickerTimeBlock:SelectBlockStr?
    
    lazy var datePick : UIDatePicker = {
        let pick = UIDatePicker()
        pick.maximumDate = Date.init(timeIntervalSinceNow: 0)
        pick.datePickerMode = .date
        if #available(iOS 13.4, *) {
            pick.preferredDatePickerStyle = .wheels
        }
        pick.addTarget(self, action: #selector(pickerAction), for: .valueChanged)
        pick.locale = Locale(identifier:"us")  // 语言设置
        return pick
    }()
    
    
    func show() {
        UIApplication.shared.delegate?.window??.addSubview(self)
    }
    func dismiss() {
        self.removeFromSuperview()
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        self.backgroundColor = .clear
        
        let bgView = UIView()
        bgView.backgroundColor = .white
        self.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(300)
        }
        
        let btnView = UIView()
        btnView.backgroundColor = RGBCOLOR(r: 247, g: 247, b: 247)
        bgView.addSubview(btnView)
        btnView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(40)
        }
        
        let closeBtn = ZQButton()
        closeBtn.setTitle("Close", for: .normal)
        closeBtn.setTitleColor(RGBCOLOR(r: 131, g: 178, b: 70), for: .normal)
        closeBtn.titleLabel?.font = FONT_M(size: 14)
        btnView.addSubview(closeBtn)
        closeBtn.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.centerY.equalToSuperview()
        }
        closeBtn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self = self else{return}
            self.dismiss()
        }).disposed(by: disposeBag)
        
        let doneBtn = ZQButton()
        doneBtn.setTitle("Done", for: .normal)
        doneBtn.setTitleColor(RGBCOLOR(r: 131, g: 178, b: 70), for: .normal)
        doneBtn.titleLabel?.font = FONT_M(size: 14)
        btnView.addSubview(doneBtn)
        doneBtn.snp.makeConstraints { make in
            make.right.equalTo(-20)
            make.centerY.equalToSuperview()
        }
        doneBtn.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let self = self else{return}
            self.dismiss()
            
            self.pickerTimeBlock?(pickerTime)
            
        }).disposed(by: disposeBag)
        
        bgView.addSubview(datePick)
        datePick.snp.makeConstraints { make in
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(btnView.snp.bottom)
            make.bottom.equalTo(-20)
        }
        
    }
    
    @objc func pickerAction(picker:UIDatePicker) {
//        print("\(picker.date.timeStamp)")
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YYYY"
        print(formatter.string(from: picker.date))
        
        pickerTime = formatter.string(from: picker.date)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

