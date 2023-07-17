//
//  CCHomeViewController.swift
//  MarketPlace
//
//  Created by XXX on 6/8/22.
//

import UIKit
import RxSwift
import SafariServices
//import ZendeskSDK
//import ZendeskSDKMessaging


class CCHomeViewController: BaseHiddenNaviController {
    

}
extension CCHomeViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
//        MPSocketManager.share.websocketUnSub(topic: .marketUpdate)
        super.viewWillDisappear(animated)
    }
    
    func startToService() {
//        guard let viewController = Zendesk.instance?.messaging?.messagingViewController() else { return }
//        self.navigationController?.show(viewController, sender: self)
    }
    
    
}



