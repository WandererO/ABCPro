//
//  MPHomeHeaderView.swift
//  MarketPlace
//
//  Created by mac on 2023/7/19.
//

import UIKit

class MPHomeHeaderView: BaseView {
    
    let pagerData:[String] = ["VCB-mb-thuong-1_Normal","VCB-mb-vip-1_Normal","VCB-mb-vip-1_Normal"]
    lazy var pagerView : FSPagerView = {///轮播
       
        let pagerView = FSPagerView()
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        pagerView.itemSize = CGSize(width: SCREEN_WIDTH - 30, height: 175)
        pagerView.delegate = self
        pagerView.dataSource = self
        pagerView.isInfinite = true
        pagerView.automaticSlidingInterval = 3
//        pagerView.corner(cornerRadius: 8)
        pagerView.interitemSpacing = 5
//        pagerView.transformer = FSPagerViewTransformer(type: .linear)
        return pagerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    func setUI(){
        self.addSubview(pagerView)
        pagerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(20)
            make.height.equalTo(175)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//banner delegate
extension MPHomeHeaderView : FSPagerViewDelegate , FSPagerViewDataSource{
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        
//        self.pageControl.numberOfPages = bannerDatas.count
        return pagerData.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        let imageStr = pagerData[index]
        cell.imageView?.image = UIImage(named: imageStr)
//        let model = self.bannerDatas[index]
        
//        cell.imageView?.kf.setImage(with: model.imgUrl)
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
