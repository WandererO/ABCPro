//
//  MPHomesHeaderView.swift
//  MarketPlace
//
//  Created by 世文 on 2023/7/19.
//

import UIKit
 
 

class MPHomesHeaderView: UIView{
   
    @IBOutlet weak var pageView: FSPagerView!
    
    @IBOutlet weak var pageViewHeight: NSLayoutConstraint!
    
  
    @IBOutlet weak var toolsVIew: UIView!
    
    
    @IBOutlet weak var toolsHeight: NSLayoutConstraint!
    
    //工具item 高度
    let toolHeight = (SCREEN_WIDTH - 4*20 - 20)/5
    //轮播图高度
    let bannerHeight = (SCREEN_WIDTH * 0.4)
    
    let pagerData:[String] = ["VCB-mb-thuong-1_Normal","VCB-mb-vip-1_Normal","VCB-mb-vip-1_Normal"]
   
    @IBOutlet weak var headIMage: UIImageView!
    
    
    @IBOutlet weak var headBottomImage: UIImageView!
    
    @IBOutlet weak var accountLable: UILabel!
    
    @IBOutlet weak var balanceLable: UILabel!
    
    
    @IBOutlet weak var bttomLeftBtn: UIButton!
    
    @IBOutlet weak var bttomRightBtn: UIButton!
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstVie: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.isUserInteractionEnabled = true
      
        self.pageView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        self.pageView.itemSize = CGSize(width: SCREEN_WIDTH - 30, height: 175)
        self.pageView.delegate = self
        self.pageView.dataSource = self
        self.pageView.isInfinite = true
        self.pageView.automaticSlidingInterval = 3
        self.pageView.interitemSpacing = 5
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
               
       
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
 
    @IBAction func copyButtonAction(_ sender: Any) {
        
        print("拷贝")
    }
    
    
    @IBAction func lookButtonAction(_ sender: UIButton) {
        
        sender.isSelected.toggle()
        
        balanceLable.text = sender.isSelected ? "123456" : "******"
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
