//
//  MPMobileTopUpController.swift
//  MarketPlace
//
//  Created by mac on 2023/7/19.
//

import UIKit

class MPMobileTopUpController: BaseHiddenNaviController {
    
    lazy var accountInput : InputView = {
        let put = InputView()
        put.inputTextField.placeholder = ""
        put.backgroundColor = .white
        put.corner(cornerRadius: 8)
        put.inputTextField.textColor = kInputTextColor
        put.setInputFieldType(typeI: .ChoiseType)
        put.choiseBtn1.setImage(UIImage(named: "arrow_down_black_ic_Normal"), for: .normal)
        put.inputTextField.tintColor = kInputTextColor
        return put
    }()
    
    lazy var numberInput : InputView = {
        let put = InputView()
        put.inputTextField.placeholder = "Phone number"
        put.backgroundColor = .white
        put.corner(cornerRadius: 8)
        put.inputTextField.textColor = kInputTextColor
        put.setInputFieldType(typeI: .ChoiseType)
        put.choiseBtn1.setImage(UIImage(named: "topup_contact_ic_Normal"), for: .normal)
        put.inputTextField.tintColor = kInputTextColor
        return put
    }()
    
    let numData = ["30,000","50,000","100,000","200,000","300,000","500,000"]
    lazy var buttonViews : UICollectionView  = {
        
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20 // 列间距
        layout.minimumInteritemSpacing = 20 // 行间距
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20) // 设置item的四边边距
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear//.gray//kMainBackgroundColor
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib(nibName: "MPTopupCell", bundle: nil), forCellWithReuseIdentifier: "MPTopupCell")
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Top up"
//        self.headerView.backgroundColor = RGBCOLOR(r: 68, g: 140, b: 58)
        self.headerView.backgroundColor = RGBCOLOR(r: 89, g: 160, b: 59)
        self.topViewLeftBtn.setImage(UIImage(named: "ic_back_family_Normal"), for: .normal)
        // Do any additional setup after loading the view.
        
        setUI()
    }

    func setUI() {
        let topBgView = UIView()
        topBgView.backgroundColor = RGBCOLOR(r: 18, g: 31, b: 37)
        self.view.addSubview(topBgView)
        topBgView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(90)
            make.height.equalTo(SCREEN_HEIGHT / 2)
        }
        
        let blureV = UIView()
        blureV.backgroundColor = RGBCOLOR(r: 18, g: 31, b: 37)
        blureV.alpha = 0.8
        self.view.addSubview(blureV)
        blureV.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
//            make.top.equalTo(numberInput.snp.bottom).offset(20)
            make.height.equalTo(SCREEN_HEIGHT / 2)
        }
        
        let tips = "Support all telecommunication networks (Viettel, Vinaphone, Mobifone, Vietnamobile, G-Mobile, I Telecom"
        let tipLab = UILabel()
//        tipLab.text = "Support all telecommunication networks (Viettel, Vinaphone, Mobifone, Vietnamobile, G-Mobile, I Telecom"
        tipLab.setStyleLineSpacing(Text: tips, Spacing: 2, alignment: .center)
        tipLab.textColor = .white
        tipLab.font = FONT_M(size: 14)
        tipLab.textAlignment = .center
        tipLab.numberOfLines = 0
        self.view.addSubview(tipLab)
        tipLab.snp.makeConstraints { make in
            make.left.equalTo(40)
            make.right.equalTo(-40)
            make.top.equalTo(120)
        }
        
        let accountLab = UILabel()
        accountLab.text = "Debit account"
        accountLab.textColor = RGBCOLOR(r: 140, g: 151, b: 156)
        accountLab.font = FONT_M(size: 14)
        self.view.addSubview(accountLab)
        accountLab.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(tipLab.snp.bottom).offset(40)
        }
        
        self.view.addSubview(accountInput)
        accountInput.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(accountLab.snp.bottom).offset(10)
            make.height.equalTo(40)
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
            make.right.equalTo(-20)
            make.top.equalTo(accountInput.snp.bottom).offset(10)
            make.height.equalTo(20)
        }
        
        let infomationBtn = ZQButton()
        infomationBtn.setImageAndTitle(NormalImageName: "m_trans_ic_Normal", SelectImageName: "", title: "Transaction information", type: .Positionleft, Space: 5)
        infomationBtn.titleLabel?.font = FONT_M(size: 14)
        self.view.addSubview(infomationBtn)
        infomationBtn.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(availableV.snp.bottom).offset(40)
        }
        
        let numLab = UILabel()
        numLab.text = "Leave blank if top up for yourself"
        numLab.textColor = RGBCOLOR(r: 140, g: 151, b: 156)
        numLab.font = FONT_M(size: 14)
        self.view.addSubview(numLab)
        numLab.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(infomationBtn.snp.bottom).offset(30)
        }
        
        self.view.addSubview(numberInput)
        numberInput.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(numLab.snp.bottom).offset(10)
            make.height.equalTo(40)
        }
        
        
        
        self.view.addSubview(buttonViews)
        buttonViews.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(numberInput.snp.bottom).offset(30)
            make.height.equalTo(100)
        }
        
        
        let confirmBtn = ZQButton()
        confirmBtn.setTitle("Continue", for: .normal)
        confirmBtn.titleLabel?.font = FONT_M(size: 14)
        confirmBtn.backgroundColor = kInputTextColor
        confirmBtn.corner(cornerRadius: 8)
        self.view.addSubview(confirmBtn)
        confirmBtn.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(buttonViews.snp.bottom).offset(40)
            make.height.equalTo(40)
        }
        
    }

}

extension MPMobileTopUpController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           
        return 6//dataModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MPTopupCell", for: indexPath) as! MPTopupCell
        cell.titleLab.text = numData[indexPath.row]
//        cell.infoModel = dataModels[indexPath.row]
//            cell.dict = quickAcessData[indexPath.row]
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: (SCREEN_WIDTH - 80 )/3, height: 40 )
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let myCell = collectionView.cellForItem(at: indexPath) as? MPTopupCell
    }
    
    
}
