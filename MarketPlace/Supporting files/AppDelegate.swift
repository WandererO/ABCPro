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
                        
            let tabbr = BaseTabBarController()
            self.window?.rootViewController = tabbr
            self.window?.makeKeyAndVisible()
        }
        
    }
    
    func requestLogin() {
        let pssword = Archive.getDefaultsForKey(key: "password")
        let account = Archive.getDefaultsForKey(key: "account")
        loginVM.requestLogin(account: account, psswd: pssword).subscribe(onNext: {[weak self] _ in
            guard let self = self else {return}
            Archive.saveToken(loginVM.loginModel.token)
            NotificationCenter.default.post(name: loginSuccessNotification, object: self)
        }).disposed(by: disposeBag)
    }
    
    
}

// MARK: - IQKeyboardManager
extension AppDelegate {
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        var handled: Bool

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
        if MPSocketManager.share.isConnected {
            MPSocketManager.share.reConnectTime = 5
            MPSocketManager.share.socketDisConnect()
            }
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

