//
//  MPHomeToolsView.swift
//  MarketPlace
//
//  Created by 世文 on 2023/7/19.
//

import UIKit


class MPHomeToolsView: UIView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var collecView: UICollectionView!
    
    
    let titles = ["VCB Fanily","Promotions","VCB Rewards","Lock card","Settings"]
    let images = ["fav_family_ic_Normal","fav_promote_Normal","fav_loyalty_ic_Normal","fav_lockcard_ic_Normal","fav_setting_ic_Normal"]
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let itemWidth : CGFloat =  CGFloat(SCREEN_WIDTH - 4*20 - 20)/5
        let flow = UICollectionViewFlowLayout()
        //字体显示不下
//        flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        flow.itemSize = CGSize(width: itemWidth, height: itemWidth + 20)
        flow.minimumLineSpacing = 20
        flow.minimumInteritemSpacing = 0
        flow.scrollDirection = .horizontal
        self.collecView.backgroundColor = .clear
        self.collecView.delegate = self
        self.collecView.dataSource = self
        self.collecView.collectionViewLayout = flow
        self.collecView.register(HomeTooleCell.self)
        

    }
    override func layoutSubviews() {
        super.layoutSubviews()
 
        self.collecView.reloadData()
        
    }
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withType: HomeTooleCell.self, for: indexPath)
        cell.backgroundColor = UIColor.clear
        let text = titles[indexPath.item]
        
        cell.locaImage.image = UIImage(named: images[indexPath.item])
        cell.nameLable.text = text
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        
    }
    
    
}
