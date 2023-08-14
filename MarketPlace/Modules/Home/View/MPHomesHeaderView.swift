//
//  MPHomesHeaderView.swift
//  MarketPlace
//
//  Created by By SW on 2023/7/19.
//

import UIKit
 
 

class MPHomesHeaderView: UIView{
   
    @IBOutlet weak var pageView: FSPagerView!
    
    @IBOutlet weak var pageViewHeight: NSLayoutConstraint!
    
  
    @IBOutlet weak var toolsVIew: UIView!
    
    
    @IBOutlet weak var toolsHeight: NSLayoutConstraint!
    
    @IBOutlet weak var welcomeLab: UILabel!
    @IBOutlet weak var balanceTip: UILabel!
    @IBOutlet weak var cardsLab: UILabel!
    @IBOutlet weak var openLab: UILabel!
    @IBOutlet weak var currentLab: UILabel!
    @IBOutlet weak var nickNameLab: UILabel!
    //工具item 高度
    let toolHeight = (SCREEN_WIDTH - 4*20 - 20)/5
    //轮播图高度
    let bannerHeight = (SCREEN_WIDTH * 0.4)
    
    let pagerData:[String] = ["banner1","banner2","banner3","banner4"]
   
    @IBOutlet weak var headIMage: UIImageView!
    
    
    @IBOutlet weak var headBottomImage: UIImageView!
    
    @IBOutlet weak var accountLable: UILabel!
    
    @IBOutlet weak var balanceLable: UILabel!
    
    
    @IBOutlet weak var bttomLeftBtn: UIButton!
    
    @IBOutlet weak var bttomRightBtn: UIButton!
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstVie: UIView!
    
    var amount = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.isUserInteractionEnabled = true
        
        
        welcomeLab.text = "Welcome".localString()
        balanceTip.text = "Balance".localString()
        cardsLab.text = "Accounts and cards".localString()
        openLab.text = "Open favorite account number".localString()
        currentLab.text = "CURRENT ACCOUNT".localString()
        
        let name = Archive.getDefaultsForKey(key: "nickName")
        nickNameLab.text = name
        
      
        self.pageView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        self.pageView.itemSize = CGSize(width: SCREEN_WIDTH - 20, height: 175)
        self.pageView.delegate = self
        self.pageView.dataSource = self
        self.pageView.isInfinite = true
        self.pageView.automaticSlidingInterval = 3
//        self.pageView.interitemSpacing = 5
        self.pageView.cornerRadius = 8
         
        toolsHeight.constant = toolHeight + 20
        pageViewHeight.constant = bannerHeight
        let tools  =  MPHomeToolsView.fromNib()
        tools.backgroundColor = .clear
        toolsVIew.addSubview(tools)
        tools.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        headIMage.IB_cornerRadius = 35
        headBottomImage.IB_cornerRadius = 10
 
        
        bttomLeftBtn.IB_cornerRadius = 10
        bttomRightBtn.IB_cornerRadius = 10
        secondView.IB_cornerRadius = 10
        firstVie.IB_cornerRadius = 10
        
 
        firstVie.configGradient(colors: [UIColor(17, 34, 42, 0).withAlphaComponent(1).cgColor,
                                         UIColor.white.withAlphaComponent(5).cgColor],
                                startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1),bounds: CGRect(x: 0, y: 0, width: SCREEN_WIDTH*0.5, height: 50))
        
        
       secondView.configGradient(colors: [UIColor(17, 34, 42, 0).withAlphaComponent(1).cgColor,
                                                UIColor.white.withAlphaComponent(5).cgColor],
                                 startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1),bounds: CGRect(x: 0, y: 0, width: SCREEN_WIDTH*0.5, height: 50))
               
        let account = Archive.getDefaultsForKey(key: "mobile")
        amount = Archive.getDefaultsForKey(key: "money").getShowPrice()
        
        accountLable.text = account
//        balanceLable.text = amount
       
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
 
    @IBAction func copyButtonAction(_ sender: Any) {
        
        print("拷贝")
    }
    
    
    @IBAction func lookButtonAction(_ sender: UIButton) {
        
        sender.isSelected.toggle()
        
        balanceLable.text = sender.isSelected ? amount : "******"
    }
    
    @IBAction func transferAction(_ sender: Any) {
        
        
        print("转账")
        
        let popVC = MPChoiseAccountController()
        popVC.show(on: CommonUtil.getCurrentVC()!, height: SCREEN_HEIGHT - 100)
        
        
//        let vc = MPAccountInfomationVC(nibName: "MPAccountInfomationVC", bundle: nil)
//        CommonUtil.getCurrentVC()?.pushViewController(vc: vc, animate: true)
        
        
    }
}


extension MPHomesHeaderView : FSPagerViewDelegate , FSPagerViewDataSource{
    func numberOfItems(in pagerView: FSPagerView) -> Int {
         
        return pagerData.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        let imageStr = pagerData[index]
        cell.imageView?.image = UIImage(named: imageStr) 
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
//        let model  = self.bannerDatas[index]
        
//        if model.imgUrl.hasPrefix("http") {
//
//            let web = WebViewController()
//            web.urlStr = model.jumpUrl
//            web.ignoreTitle = false
//            self.viewContainingController()?.navigationController?.pushViewController(web, animated: true)
//        }
    }
    
    // MARK:- FSPagerView Delegate
//    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
//        self.pageControl.currentPage = targetIndex
//    }
//
//    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
//        self.pageControl.currentPage = pagerView.currentIndex
//    }
    
    
    
    
}


