//
//  MPHomeToolsView.swift
//  MarketPlace
//
//  Created by By SW on 2023/7/19.
//

import UIKit


class MPHomeToolsView: UIView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var collecView: UICollectionView!
    
    //外部悬浮隐藏title
    var isHiddenTitle = false{
        didSet{
            if isHiddenTitle == true {
                self.flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
            }
        }
    }
    let flow = UICollectionViewFlowLayout()
    let titles = ["VCB Family".localString(),"Promotions".localString(),"VCB Rewards".localString(),"Lock card".localString(),"Settings".localString()]
    let images = ["fav_family_ic_Normal","fav_promote_Normal","fav_loyalty_ic_Normal","fav_lockcard_ic_Normal","fav_setting_ic_Normal"]
    
    
    //账号信息界面地步工具
    var accountData : [[String:String]] = [[:]]
    var isInfomationVC = false{
        didSet{
            if isInfomationVC == true{
                self.flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                let itemWidth : CGFloat =  CGFloat(SCREEN_WIDTH / 5 + 10)
                self.flow.itemSize = CGSize(width: itemWidth, height: itemWidth + 20)
                self.flow.minimumLineSpacing = 10
            }
        }
    }
    
    //回掉Block
     var selctItemBlock: BlockWithParameters<Int>?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let itemWidth : CGFloat =  CGFloat(SCREEN_WIDTH / 5)
        flow.itemSize = CGSize(width: itemWidth, height: itemWidth)
        flow.minimumLineSpacing = 20
        flow.minimumInteritemSpacing = 0
        flow.scrollDirection = .horizontal
        self.collecView.backgroundColor = .clear
        self.collecView.delegate = self
        self.collecView.dataSource = self
        self.collecView.collectionViewLayout = flow
        self.collecView.register([HomeTooleCell.self,MPHomeSectionCell.self])
      

    }
    override func layoutSubviews() {
        super.layoutSubviews()
 
        
        self.collecView.reloadData()
        
    }
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if isInfomationVC == true{
            return accountData.count
        }
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if isInfomationVC == true{
            let cell = collectionView.dequeueReusableCell(withType: MPHomeSectionCell.self, for: indexPath)
            if  let dic = accountData[indexPath.item] as? [String:String],
                let text = dic["text"],
                let img = dic["img"]{
                
                cell.nameLable.text = text
                cell.locaImage.image = UIImage(named: img)
                
            }
            
            return cell
            
        }else{
            let cell = collectionView.dequeueReusableCell(withType: HomeTooleCell.self, for: indexPath)
            cell.backgroundColor = UIColor.clear
            
            let text = titles[indexPath.item]
            cell.locaImage.image = UIImage(named: images[indexPath.item])
            cell.nameLable.text = text
            //判断外部悬浮控件
            cell.nameLable.isHidden = isHiddenTitle
            cell.imageTop.constant = isHiddenTitle ? 10 : 0
            return cell
        }
       
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        if isInfomationVC == true{
            
            
            selctItemBlock?(indexPath.row)
            
        }else{
            
            selctItemBlock?(indexPath.row)
            
            
        }
    }
    
    
}
