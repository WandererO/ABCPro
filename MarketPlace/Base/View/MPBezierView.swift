//
//  MPBezierView.swift
//  MarketPlace
//
//  Created by mac on 2023/7/21.
//

import UIKit

class MPBezierView: UIView {
    
    
    
    func show() {
        UIApplication.shared.delegate?.window??.addSubview(self)
    }
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        self.backgroundColor = .white
        
//        let grayBgV = UIView()
//        grayBgV.backgroundColor = .gray
//        self.addSubview(grayBgV)
//        grayBgV.snp.makeConstraints { make in
//            make.left.bottom.right.equalToSuperview()
//            make.height.equalTo(SCREEN_HEIGHT / 2)
//        }
//        self.sendSubviewToBack(grayBgV)
       
    }
    
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //灰色背景
        UIColor.gray.set()
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: SCREEN_HEIGHT / 2 + 5, width: SCREEN_WIDTH, height: SCREEN_HEIGHT / 2 - 50), byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 10, height: 10))
        path.lineWidth = 5.0
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        path.fill()

        
        //最外半圈
        let path1 = UIBezierPath(arcCenter: CGPoint(x: SCREEN_WIDTH / 2, y: SCREEN_HEIGHT / 2 - 5), radius: 170, startAngle: .pi , endAngle: 0.0, clockwise: true)
        path1.lineWidth = 20
        path1.lineCapStyle = .butt
        path1.lineJoinStyle = .round
        UIColor.green.setStroke()
        path1.stroke()
        
        
        UIColor.white.set()
        //底色白色圆（遮住灰色背景半圆效果）
        let path2 = UIBezierPath(arcCenter: CGPoint(x: SCREEN_WIDTH / 2, y: SCREEN_HEIGHT / 2 + 5), radius: 160, startAngle: 0, endAngle:2 * .pi, clockwise: true)
        path2.lineWidth = 1
        path2.lineCapStyle = .round
        path2.lineJoinStyle = .round
//        UIColor.red.setStroke()
        path2.fill()
        
        //内半圈 绿色
        let path3 = UIBezierPath(arcCenter: CGPoint(x: SCREEN_WIDTH / 2, y: SCREEN_HEIGHT / 2 - 5), radius: 140, startAngle: .pi , endAngle: 0.0, clockwise: true)
        path3.lineWidth = 25
        path3.lineCapStyle = .butt
        path3.lineJoinStyle = .round
        UIColor.green.setStroke()
        path3.stroke()
        
        //U半圈 灰色
        let path4 = UIBezierPath(arcCenter: CGPoint(x: SCREEN_WIDTH / 2, y: SCREEN_HEIGHT / 2 + 5), radius: 140, startAngle: 0 , endAngle: .pi, clockwise: true)
        path4.lineWidth = 25
        path4.lineCapStyle = .butt
        path4.lineJoinStyle = .round
        UIColor.gray.setStroke()
        path4.stroke()
        
        //虚线圆
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100,y: 100), radius: 110, startAngle: 0.0, endAngle: 2 * .pi, clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.position = CGPoint(x: SCREEN_WIDTH / 2 - 100, y: SCREEN_HEIGHT / 2 - 100)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2
        let one : NSNumber = 5
        let two : NSNumber = 3
        shapeLayer.lineDashPattern = [one,two]
        shapeLayer.lineCap = CAShapeLayerLineCap.butt
        self.layer.addSublayer(shapeLayer)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
