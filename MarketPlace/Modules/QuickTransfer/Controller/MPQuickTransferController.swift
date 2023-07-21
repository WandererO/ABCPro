//
//  MPQuickTransferController.swift
//  MarketPlace
//
//  Created by mac on 2023/7/20.
//

import UIKit
import AttributedString

class MPQuickTransferController: BaseHiddenNaviController {
    
    lazy var scrollV = UIScrollView()
    
    
    lazy var topLab : UILabel = {
        let lab = UILabel()
        lab.numberOfLines = 0
        lab.textAlignment = .left
        lab.attributed.text = .init("""
Quick transfer 247 is the quick money transfer \(.image(#imageLiteral(resourceName: "247_dark_ic_Normal"), .custom(size: .init(width: 63, height: 13)))) or the bilateral transfer service
""", .font(FONT_M(size: 14)), .foreground(RGBCOLOR(r: 134, g: 141, b: 148)))
        return lab
    }()
    
    lazy var choiseCarInput : InputView = {
        let put = InputView()
        put.inputTextField.text = "Quick transfer via"
        put.backgroundColor = .white
        put.corner(cornerRadius: 8)
        put.inputTextField.textColor = kInputTextColor
        put.setInputFieldType(typeI: .ChoiseType)
        put.choiseBtn1.setImage(UIImage(named: "arrow_down_black_ic_Normal"), for: .normal)
        put.inputTextField.tintColor = kInputTextColor
        return put
    }()
    
    lazy var notesBtn : ZQButton = {
        let btn = ZQButton()
        btn.setImageAndTitle(NormalImageName: "info_green_ic_Normal", SelectImageName: "", title: "Service description and notes", type: .Positionleft, Space: 3)
        btn.setTitleColor(kInputTextColor, for: .normal)
        btn.titleLabel?.font = FONT_M(size: 14)
        return btn
    }()
    //icCard_Normal. icHanhkhach_Normal
    lazy var senderBtn : ZQButton = {
        let btn = ZQButton()
        btn.setImageAndTitle(NormalImageName: "icCard_Normal", SelectImageName: "", title: "Sender information", type: .Positionleft, Space: 5)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = FONT_SB(size: 16)
        return btn
    }()
    
    lazy var accountInput : InputView = {
        let put = InputView()
        put.inputTextField.text = "1089292"
        put.backgroundColor = .white
        put.corner(cornerRadius: 8)
        put.inputTextField.textColor = kInputTextColor
        put.setInputFieldType(typeI: .ChoiseType)
        put.choiseBtn1.setImage(UIImage(named: "arrow_down_black_ic_Normal"), for: .normal)
        put.inputTextField.tintColor = kInputTextColor
        return put
    }()
    
    lazy var beneficiaryBtn : ZQButton = {
        let btn = ZQButton()
        btn.setImageAndTitle(NormalImageName: "icHanhkhach_Normal", SelectImageName: "", title: "Beneficiary information", type: .Positionleft, Space: 5)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = FONT_SB(size: 16)
        return btn
    }()
    
    lazy var templateBtn : TitleImgButton = {
        let btn = TitleImgButton()
        btn.title = "Transfer template"
        btn.textColor = kInputTextColor
        btn.font = FONT_M(size: 14)
        btn.imageWidth = 12
        btn.rightImage = UIImage(named: "bill_template_ic_Normal")
        return btn
    }()
    
    //add_sochon_ic_Normal
    lazy var addBtn : TitleImgButton = {
        let btn = TitleImgButton()
        btn.title = "Add beneficiary"
        btn.textColor = kInputTextColor
        btn.font = FONT_M(size: 16)
        btn.imageWidth = 16
        btn.margin = 3
        btn.rightImage = UIImage(named: "addmore_ic_Normal")
        return btn
    }()
    
    lazy var bankInput : InputView = {
        let put = InputView()
        put.inputTextField.placeholder = "Beneficiary bank"
        put.backgroundColor = .white
        put.corner(cornerRadius: 8)
        put.inputTextField.textColor = kInputTextColor
        put.setInputFieldType(typeI: .ChoiseType)
        put.choiseBtn1.setImage(UIImage(named: "arrow_down_black_ic_Normal"), for: .normal)
        put.inputTextField.tintColor = kInputTextColor
        return put
    }()
    lazy var selectVNDInput : InputView = {
        let put = InputView()
        put.inputTextField.placeholder = "Enter/ select beneficiary account VNDk"
        put.backgroundColor = .white
        put.corner(cornerRadius: 8)
        put.inputTextField.textColor = kInputTextColor
        put.setInputFieldType(typeI: .ChoiseType)
        put.choiseBtn1.setImage(UIImage(named: "topup_contact_ic_Normal"), for: .normal)
        put.inputTextField.tintColor = kInputTextColor
        return put
    }()
    
    lazy var transactionBtn : ZQButton = {
        let btn = ZQButton()
        btn.setImageAndTitle(NormalImageName: "m_trans_ic_Normal", SelectImageName: "", title: "Transaction information", type: .Positionleft, Space: 5)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = FONT_SB(size: 16)
        return btn
    }()
    
    lazy var limitBtn : TitleImgButton = {
        let btn = TitleImgButton()
        btn.title = "Limit"
        btn.textColor = kInputTextColor
        btn.font = FONT_M(size: 14)
        btn.imageWidth = 14
        btn.margin = 5
        btn.rightImage = UIImage(named: "info_mini_icselected_ic_Normal")
        return btn
    }()
    
    lazy var amountInput : InputView = {
        let put = InputView()
        put.inputTextField.placeholder = "Amount"
        put.backgroundColor = .white
        put.corner(cornerRadius: 8)
        put.inputTextField.textColor = kInputTextColor
        put.setInputFieldType(typeI: .NomalType)
        put.bindBtn.isHidden = false
        put.inputTextField.tintColor = kInputTextColor
        return put
    }()
    
    lazy var senderInput : InputView = {
        let put = InputView()
        put.inputTextField.text = "Sender pays"
        put.backgroundColor = .white
        put.corner(cornerRadius: 8)
        put.inputTextField.textColor = kInputTextColor
        put.setInputFieldType(typeI: .ChoiseType)
        put.choiseBtn1.setImage(UIImage(named: "arrow_down_black_ic_Normal"), for: .normal)
        put.inputTextField.tintColor = kInputTextColor
        return put
    }()
    lazy var typeInput : InputView = {
        let put = InputView()
        put.inputTextField.text = "VU DANG TUNG transfer"
        put.backgroundColor = .white
        put.corner(cornerRadius: 8)
        put.inputTextField.textColor = kInputTextColor
        put.setInputFieldType(typeI: .ChoiseType)
        put.choiseBtn1.setImage(UIImage(named: "edit_black_ic_Normal"), for: .normal)
        put.inputTextField.tintColor = kInputTextColor
        return put
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Quick transfer 247"
      
       
  
        
//        self.headerView.backgroundColor = RGBCOLOR(r: 89, g: 160, b: 59)
        self.topViewLeftBtn.setImage(UIImage(named: "ic_back_family_Normal"), for: .normal)
        // Do any additional setup after loading the view.
        
        self.setUI()
    }
    
    func setUI() {
        
//        scrollV.contentSize = CGSize(width: 0, height: SCREEN_HEIGHT)
        self.view.addSubview(scrollV)
//        self.scrollV.frame = CGRect(x: 0, y: 88, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        self.scrollV.backgroundColor = UIColor(17, 34, 42, 0).withAlphaComponent(0.8)
        scrollV.snp.makeConstraints { make in
            make.left.bottom.equalToSuperview()
            make.width.equalTo(SCREEN_WIDTH)
            make.top.equalTo(self.headerView.snp.bottom)
        }
//
        scrollV.addSubview(topLab)
        topLab.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.width.equalTo(SCREEN_WIDTH - 40)
            make.top.equalTo(50)

        }
        
        scrollV.addSubview(choiseCarInput)
        choiseCarInput.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.width.equalTo(SCREEN_WIDTH - 40)
            make.top.equalTo(topLab.snp.bottom).offset(30)
            make.height.equalTo(40)
        }
        
        scrollV.addSubview(notesBtn)
        notesBtn.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(choiseCarInput.snp.bottom).offset(20)
        }
        
        scrollV.addSubview(senderBtn)
        senderBtn.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(notesBtn.snp.bottom).offset(30)
        }
        
        let accountLab = UILabel()
        accountLab.text = "Debit account"
        accountLab.textColor = RGBCOLOR(r: 140, g: 151, b: 156)
        accountLab.font = FONT_M(size: 14)
        scrollV.addSubview(accountLab)
        accountLab.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(senderBtn.snp.bottom).offset(30)
        }
        
        scrollV.addSubview(accountInput)
        accountInput.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(accountLab.snp.bottom).offset(10)
            make.height.equalTo(40)
            make.width.equalTo(SCREEN_WIDTH - 40)
        }
        
        let availableV = TitleValueLabelView()
        availableV.title = "Available balance"
        availableV.titleFont = FONT_M(size: 14)
        availableV.textColor = RGBCOLOR(r: 140, g: 151, b: 156)
//        serviceChargeV.valueFont = FONT_R(size: 14)
        availableV.value = "5000 VND"
        self.view.addSubview(availableV)
        availableV.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.width.equalTo(SCREEN_WIDTH - 40)
            make.top.equalTo(accountInput.snp.bottom).offset(10)
            make.height.equalTo(20)
        }
        
        scrollV.addSubview(beneficiaryBtn)
        beneficiaryBtn.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(availableV.snp.bottom).offset(30)
        }
        
        scrollV.addSubview(templateBtn)
        templateBtn.snp.makeConstraints { make in
            make.right.equalTo(self.view.snp.right).offset(-20)
            make.top.equalTo(availableV.snp.bottom).offset(30)
        }
        
        scrollV.addSubview(addBtn)
        addBtn.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(beneficiaryBtn.snp.bottom).offset(30)
        }
        
        scrollV.addSubview(bankInput)
        bankInput.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.width.equalTo(SCREEN_WIDTH - 40)
            make.top.equalTo(addBtn.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        scrollV.addSubview(selectVNDInput)
        selectVNDInput.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.width.equalTo(SCREEN_WIDTH - 40)
            make.top.equalTo(bankInput.snp.bottom).offset(10)
            make.height.equalTo(40)
        }
        
        scrollV.addSubview(transactionBtn)
        transactionBtn.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(selectVNDInput.snp.bottom).offset(30)
        }
        
        scrollV.addSubview(limitBtn)
        limitBtn.snp.makeConstraints { make in
            make.right.equalTo(self.view.snp.right).offset(-20)
            make.top.equalTo(selectVNDInput.snp.bottom).offset(30)
        }
        
        scrollV.addSubview(amountInput)
        amountInput.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.width.equalTo(SCREEN_WIDTH - 40)
            make.top.equalTo(transactionBtn.snp.bottom).offset(20)
            make.height.equalTo(40)
        }
        
        scrollV.addSubview(senderInput)
        senderInput.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.width.equalTo(SCREEN_WIDTH - 40)
            make.top.equalTo(amountInput.snp.bottom).offset(10)
            make.height.equalTo(40)
        }
        
        scrollV.addSubview(typeInput)
        typeInput.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.width.equalTo(SCREEN_WIDTH - 40)
            make.top.equalTo(senderInput.snp.bottom).offset(10)
            make.height.equalTo(40)
        }
        
        let confirmBtn = ZQButton()
        confirmBtn.setTitle("Continue", for: .normal)
        confirmBtn.titleLabel?.font = FONT_M(size: 14)
        confirmBtn.backgroundColor = kInputTextColor
        confirmBtn.corner(cornerRadius: 8)
        scrollV.addSubview(confirmBtn)
        confirmBtn.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.width.equalTo(SCREEN_WIDTH - 40)
            make.top.equalTo(typeInput.snp.bottom).offset(40)
            make.height.equalTo(45)
            make.bottom.equalTo(-30)
        }
        
        
        
    }

}
