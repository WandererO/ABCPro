//
//  MPAccountMainView.swift
//  MarketPlace
//
//  Created by 世文 on 2023/7/21.
//

import UIKit

class MPAccountMainView: UIView  {
    
    var searchMoreBlock:NormalBlock?

    @IBOutlet weak var lineView: UIView!
  
    //数据源 * 行高
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    //数据列表
    @IBOutlet weak var listTableView: UITableView!
    
    @IBAction func listBtnAction(_ sender: UIButton) {
         
        print("按钮点击\(sender.tag)")
        UIView.animate(withDuration: 0.1) {
            self.lineView.centerX = sender.centerX
        }
        
    }
    
    @IBAction func moreClick(_ sender: Any) {
        self.searchMoreBlock?()
        
    }
    override  func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor(17, 34, 42, 0).withAlphaComponent(0.8)
        
        //嵌套不滚动
        self.listTableView.isScrollEnabled = false
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        self.listTableView.register(MPAccountTotalCell.self)
        self.listTableView.backgroundColor =  .clear
        
        self.tableViewHeight.constant = 20 * 65
        
    }
}
extension MPAccountMainView : UITableViewDelegate , UITableViewDataSource{
    
    
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
