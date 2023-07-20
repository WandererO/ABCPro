//
//  MPHomeToolsView.swift
//  MarketPlace
//
//  Created by 世文 on 2023/7/19.
//

import UIKit


class MPHomeToolsView: UIView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var collecView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let itemWidth : CGFloat =  CGFloat(SCREEN_WIDTH - 4*30 - 20)/5
        let flow = UICollectionViewFlowLayout()
        flow.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        flow.itemSize = CGSize(width: itemWidth, height: itemWidth + 20)
        flow.minimumLineSpacing = 30
        flow.minimumInteritemSpacing = 0
        flow.scrollDirection = .horizontal
        self.collecView.backgroundColor = .red
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
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withType: HomeTooleCell.self, for: indexPath)
        cell.backgroundColor = UIColor.random
        let text = "ABC" + "\(indexPath.row)"
        
        cell.locaImage.image = UIImage(named: "fav_lockcard_ic_Normal")
        cell.nameLable.text = text
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
}
