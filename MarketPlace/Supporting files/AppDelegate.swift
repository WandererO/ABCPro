//
//  AppDelegate.swift
//  MarketPlace
//
//  Created by tanktank on 2023/2/19.
//

import UIKit
import IQKeyboardManagerSwift
//import FirebaseCore
//import FirebaseAnalytics

import ZendeskSDK
import ZendeskSDKMessaging
import ESTabBarController_swift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let disposeBag = DisposeBag()
    
    let loginVM = MPPublicViewModel()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setIQKeyboardManager()
        

        requestLogin()
        
        self.setUI()
        
        if let languageType = UserDefaults.standard.value(forKey: "language"){
//            print("进来")
//            print(languageType)
            let type = languageType as! String
            switch type {
            case "en":
                LanguageManager.setLanguage(.english)
            case "zh-Hans":
                LanguageManager.setLanguage(.chinese)
            case "zh-HK":
                LanguageManager.setLanguage(.HongKong)
            case "vi":
                LanguageManager.setLanguage(.Vietnamese)
            default:
                break
            }
        }

        
        ///配置数据库
//        RealmHelper.configRealm()
        ///初始化指标设置
//        loadKlineIndicate()
        print("===========用户Token：：：：\(Archive.getToken())")
        
        
//        requestVersion()
        
        
        return true
    }
    
    /// 当应用终止的时候起作用
    func applicationWillTerminate(_ application: UIApplication) {
      // 调用保存数据的方法
//        if Archive.getFaceID() && Archive.getToken().count>0{
//            Archive.saveToken("")
//        }
    }
    
    func setUI(){
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = kGreyTextColor
        
//        let tabbr = BaseTabBarController()
        let tabbr = MPLoginnController()
        lazy var baseWelcomeVC = BaseNavigationController.init(rootViewController: tabbr)
        self.window?.rootViewController = baseWelcomeVC
        window?.makeKeyAndVisible()
//        tabbr.configyrationLatestVersion()
        
        
        ///登录成功通知
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: loginSuccessNotification.rawValue), object: nil,  queue: nil) { (notification) in
                     
            self.setTabbarController()
            
//            let tabbr = BaseTabBarController()
//            self.window?.rootViewController = tabbr
//            self.window?.makeKeyAndVisible()
        }
        
    }
    
    func requestLogin() {
        let pssword = Archive.getDefaultsForKey(key: "password")
        let account = Archive.getDefaultsForKey(key: "account")
        
        loginVM.requestLogin(account: account, psswd: pssword).subscribe(onNext: {[weak self] _ in
            guard let self = self else {return}
            
            let token = self.loginVM.loginModel.userinfo?.token ?? ""
            let money = self.loginVM.loginModel.userinfo?.money ?? ""
            let account = self.loginVM.loginModel.userinfo?.mobile ?? ""
            Archive.setDefaults(value: money, key: "money")
            Archive.setDefaults(value: account, key: "mobile")
            Archive.saveToken(token)
            NotificationCenter.default.post(name: loginSuccessNotification, object: self)
        }).disposed(by: disposeBag)
    }
    
    func setTabbarController() {//自定义tabbar
        let tabbar = ESTabBarController()
        
        let homeVC = CCHomeViewController()
        let topUpVC = MPMobileTopUpController()
        let QRVc = MPQRServicesController()
        let internalVC = MPInternalTransferController()
        let quickVC = MPQuickTransferController()
        
        
        tabbar.shouldHijackHandler = { tabbar, viewContro, idx in
            
            if idx != 0 {
                return true
            }
            return false
        }
        tabbar.didHijackHandler = {tabbar, viewContro, idx in
            
            let selectNav = viewContro as? BaseNavigationController
            let pushVC = MPMobileTopUpController()
            selectNav?.pushViewController(pushVC, animated: true)
            
            print("=========")
        }
        
        UITabBar.appearance().backgroundColor = RGBCOLOR(r: 24, g: 39, b: 44)
        
        
        
        homeVC.tabBarItem = ESTabBarItem.init(BaseTabbarItemView(), title: "Home", image: UIImage(named: "tab_home_unselect_Normal"), selectedImage: UIImage(named: "tabBar_home_ic_Normal"))
        topUpVC.tabBarItem = ESTabBarItem.init(BaseTabbarItemView(), title: "Mobile topup", image: UIImage(named: "tabBar_topup_ic_Normal"), selectedImage: UIImage(named: ""))
        QRVc.tabBarItem = ESTabBarItem.init(BaseTabbarItemView(), title: "QR Services", image: UIImage(named: "tabBar_qr_ic_Normal"), selectedImage: UIImage(named: ""))
        internalVC.tabBarItem = ESTabBarItem.init(BaseTabbarItemView(), title: "Internal transfer", image: UIImage(named: "tabBar_transIn_ic_Normal"), selectedImage: UIImage(named: ""))
        quickVC.tabBarItem = ESTabBarItem.init(BaseTabbarItemView(), title: "Quick transfer247", image: UIImage(named: "tabBar_trans247_ic_Normal"), selectedImage: UIImage(named: ""))
        
        lazy var baseHomeNav = BaseNavigationController.init(rootViewController: homeVC)
        lazy var topUpNav = BaseNavigationController.init(rootViewController: topUpVC)
        lazy var QRNav = BaseNavigationController.init(rootViewController: QRVc)
        lazy var internalNav = BaseNavigationController.init(rootViewController: internalVC)
        lazy var quickNav = BaseNavigationController.init(rootViewController: quickVC)
        
        tabbar.viewControllers = [baseHomeNav, topUpNav, QRNav, internalNav,quickNav]
        
        self.window?.rootViewController = tabbar
        self.window?.makeKeyAndVisible()
    }
}

class BaseTabbarItemView:ESTabBarItemContentView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        textColor = RGBCOLOR(r: 135, g: 147, b: 152)//UIColor.init(white: 175.0 / 255.0, alpha: 1.0)
        highlightTextColor = kInputTextColor//UIColor.init(red: 254/255.0, green: 73/255.0, blue: 42/255.0, alpha: 1.0)
        iconColor = RGBCOLOR(r: 135, g: 147, b: 152)//UIColor.init(white: 175.0 / 255.0, alpha: 1.0)
        highlightIconColor = kInputTextColor//UIColor.init(red: 254/255.0, green: 73/255.0, blue: 42/255.0, alpha: 1.0)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - IQKeyboardManager
extension AppDelegate {
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
//        var handled: Bool

//          handled = GIDSignIn.sharedInstance.handle(url)
//          if handled {
//            return true
//          }

          // Handle other custom URL types.

          // If not handled by this app, return false.
          return false
    }
    
    func setIQKeyboardManager(){
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.shouldToolbarUsesTextFieldTintColor = true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
//        if MPSocketManager.share.isConnected {
//            MPSocketManager.share.reConnectTime = 5
//            MPSocketManager.share.socketDisConnect()
//            }
     }

    //进入前台模式，主动连接socket
        func applicationDidBecomeActive(_ application: UIApplication) {
            //解决因为网络切换或链接不稳定问题，引起socket断连问题
            //如果app从无网络，到回复网络，需要执行重连
//            if !MPSocketManager.share.isConnected {
//                MPSocketManager.share.reConnectTime = 0
//                MPSocketManager.share.socketReconnect(time:0)
//            }
        }
}

