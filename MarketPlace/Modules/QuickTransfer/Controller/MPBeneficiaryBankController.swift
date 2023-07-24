//
//  MPBeneficiaryBankController.swift
//  MarketPlace
//
//  Created by mac on 2023/7/22.
//

import UIKit

class MPBeneficiaryBankController: BaseHiddenNaviController {

    @IBOutlet weak var topBgV: UIView!
    @IBOutlet weak var searchBgview: UIView!
    @IBOutlet weak var searchField: UITextField!
    
    var didSelectBlock:((MPBankModel)->())?
    
    var isSearch = false
    var searchResultAry:[MPBankModel] = []
    
    let datas = [["image":"agribank","title":"AGRIBANK","content":"Vietnam Bank for Agriculture and Rural"],["image":"bidv","title":"BIDV","content":"Bank for Investment and Development of"],["image":"vietin","title":"VIETINBANK","content":"Bank for Industry and Trade (VIETINBANK)"] ,["image":"vp","title":"VPBANK","content":"Vietnam Prosperity Bank (VPBANK)"] ,["image":"citi","title":"CITIBANK VIETNAM","content":"CITIBANK VIETNAM"] ,["image":"default_bank_logo_Normal","title":"MAFC","content":"Mirae Asset Finance Company VN (MAFC)"] ,["image":"abbank","title":"ABBANK","content":"An Binh Bank (ABBANK)"]]
    var bankModels:[MPBankModel] = []
    
    lazy var tableView : BaseTableView = {
        
        let table = BaseTableView(frame: CGRect.zero, style: .plain)
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = kMainBackgroundColor
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.register(UINib(nibName: "MPBeneficiaryBankCell", bundle: nil), forCellReuseIdentifier: "MPBeneficiaryBankCell")
        table.autoresizingMask  = .flexibleHeight
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerView.isHidden = true
        self.view.corner(cornerRadius: 15)
        topBgV.setGradMainColor()
        // Do any additional setup after loading the view.
        setUI()
        
        //json转model
        bankModels  =  datas.compactMap({ dict in
            let model = MPBankModel.deserialize(from: dict)
            return model
        })
        
        
        searchField.rx.controlEvent([.editingChanged]).asObservable().subscribe(onNext: {[weak self] _ in
            guard let self = self else{return}
            self.isSearch = self.searchField.text!.isEmpty ? false:true
            self.searchResultAry = self.bankModels.filter { model in
                return model.title.lowercased().contains(self.searchField.text!.lowercased())
            }
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
        
    }
    func setUI() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(searchBgview.snp.bottom)
        }
    }

    @IBAction func closeClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
extension MPBeneficiaryBankController : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return isSearch ? searchResultAry.count : bankModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "MPBeneficiaryBankCell", for: indexPath) as! MPBeneficiaryBankCell
        cell.selectionStyle = .none
        cell.model = isSearch ? searchResultAry[indexPath.row] : self.bankModels[indexPath.row]
        return cell
        
    }

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true)
        
        let model = isSearch ? searchResultAry[indexPath.row] : bankModels[indexPath.row]
        self.didSelectBlock?(model)
    }
    
}

extension MPBeneficiaryBankController {
    func show(on VC : UIViewController , height : CGFloat){
        
        var configuration = NBBottomSheetConfiguration(sheetSize: .fixed(height))
        configuration.backgroundViewColor = UIColor.black.withAlphaComponent(0.5)
        configuration.animationDuration = 0.5
        let bottomSheetController = NBBottomSheetController(configuration: configuration)
        bottomSheetController.present(self, on: VC)
    }
}
