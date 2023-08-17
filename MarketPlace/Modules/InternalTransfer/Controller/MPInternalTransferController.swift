//
//  MPInternalTransferController.swift
//  MarketPlace
//
//  Created by mac on 2023/7/20.
//

import UIKit

class MPInternalTransferController: BaseHiddenNaviController {
    
    var successModel = MPTransferSuccessModel()
    
    @IBOutlet weak var amountInput: UITextField!
    @IBOutlet weak var dateTimeInput: UITextField!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var accountInput: UITextField!
    @IBOutlet weak var bankNameInput: UITextView!
    @IBOutlet weak var codeInput: UITextField!
    @IBOutlet weak var contentInput: UITextView!
    @IBOutlet weak var dateLab: UILabel!
    
    var dateStr = ""
    var weeksStr = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Internal transfer"
        self.headerView.backgroundColor = RGBCOLOR(r: 89, g: 160, b: 59)
        self.topViewLeftBtn.setImage(UIImage(named: "ic_back_family_Normal"), for: .normal)
        
        getDateString()
        
        
    }
    @IBAction func getDateClick(_ sender: Any) {
        
        getDateString()
        
    }
    
    @IBAction func nextClick(_ sender: Any) {
        
        if amountInput.text?.isEmpty == true {
            HudManager.showOnlyText("输入金额")
            return
        } else if dateTimeInput.text?.isEmpty == true {
            HudManager.showOnlyText("输入时间")
            return
        } else if nameInput.text?.isEmpty == true {
            HudManager.showOnlyText("输入收款人姓名")
            return
        } else if accountInput.text?.isEmpty == true {
            HudManager.showOnlyText("输入收款人账号")
            return
        } else if codeInput.text?.isEmpty == true {
            HudManager.showOnlyText("输入编码")
            return
        } else if contentInput.text?.isEmpty == true {
            HudManager.showOnlyText("输入备注")
            return
        }
        
        let minisTime = dateTimeInput.text ?? ""
        let resultTime = minisTime + " \(weeksStr) " + dateStr
        
        successModel.amount = amountInput.text ?? ""
        successModel.time = resultTime
        successModel.name = nameInput.text ?? ""
        successModel.account = accountInput.text ?? ""
        successModel.bank = bankNameInput.text ?? ""
        successModel.code = codeInput.text ?? ""
        successModel.content = contentInput.text ?? ""
        
        
        let vc = MPTransferSuccessController()
        vc.model = successModel
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func getDateString() {
        dateStr = String.getCurrentSysDate()
        weeksStr = String.featureWeekday().localString()
        dateLab.text = weeksStr + " \(dateStr)"
    }
}

