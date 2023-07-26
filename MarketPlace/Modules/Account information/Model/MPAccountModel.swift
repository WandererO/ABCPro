//
//  MPAccountModel.swift
//  MarketPlace
//
//  Created by mac on 2023/7/27.
//

import UIKit

class MPAccountModel: BaseModel {

    ///金额
    var amount:String = ""
    ///内容
    var content:String = ""
    ///时间
    var date:String = ""
    ///类型 0全部 1转入 2转出
    var type:String = ""
    ///转账编号
    var number:String = ""
}
