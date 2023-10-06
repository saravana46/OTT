//
//  TabbarController.swift
//  OTT
//
//  Created by user on 28/08/23.
//

import UIKit
import SOTabBar

class TabbarController: SOTabBarController {
    
    override func loadView() {
        super.loadView()
        SOTabBarSetting.tabBarTintColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        SOTabBarSetting.tabBarCircleSize = CGSize(width: 60, height: 60)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        let homeVC = UIStoryboard(name: "HomePage", bundle: nil).instantiateViewController(withIdentifier: "HomePageViewController")
        let chatVC = UIStoryboard(name: "HomePage", bundle: nil).instantiateViewController(withIdentifier: "ChatViewController")
        let onlineVC = UIStoryboard(name: "HomePage", bundle: nil).instantiateViewController(withIdentifier: "OnlineViewController")
        let profileVC = UIStoryboard(name: "HomePage", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController")
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "Home_unsel"), selectedImage: UIImage(named: "Home_sel"))
        let userVCNavi = UINavigationController(rootViewController: homeVC)
        userVCNavi.isNavigationBarHidden = true
        
        chatVC.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(named: "chat_unsel"), selectedImage: UIImage(named: "chat_sel"))
        let mapVCNavi = UINavigationController(rootViewController: chatVC)
        mapVCNavi.isNavigationBarHidden = true
        
        onlineVC.tabBarItem = UITabBarItem(title: "Online", image: UIImage(named: "earth_unsel"), selectedImage: UIImage(named: "earth_sel"))
        let ImageVCNavi = UINavigationController(rootViewController: onlineVC)
        ImageVCNavi.isNavigationBarHidden = true
        
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user_unsel"), selectedImage: UIImage(named: "user_sel"))
        let profileVCNavi = UINavigationController(rootViewController: profileVC)
        profileVCNavi.isNavigationBarHidden = true
        
        viewControllers = [homeVC,chatVC,onlineVC,profileVC]
        
    }
    
}

extension TabbarController: SOTabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: SOTabBarController, didSelect viewController: UIViewController) {
        print(viewController.tabBarItem.title ?? "")
    }
    
}
