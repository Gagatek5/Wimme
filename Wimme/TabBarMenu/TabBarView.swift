//
//  TabBarView.swift
//  Wimme
//
//  Created by Tom on 18/11/2017.
//  Copyright © 2017 doThisApp. All rights reserved.
//

import UIKit

class TabBarView: UITabBarController {
    var test: String?
    override func viewDidLoad() {
        super.viewDidLoad()
            var tabMainView: UIViewController
            var tabSearch: UIViewController
            var tabProfile: UIViewController

            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let mainView : MainViewNC  = storyboard.instantiateViewController(withIdentifier: "MainView") as! MainViewNC
            let search : SearchEventNC  = storyboard.instantiateViewController(withIdentifier: "Search") as! SearchEventNC
            let profile : ProfileNC  = storyboard.instantiateViewController(withIdentifier: "Profile") as! ProfileNC
        tabMainView = mainView
        tabMainView.title = "MainView"
        tabMainView.tabBarItem.image = UIImage(named: "Main.png")
        tabSearch = search
        tabSearch.title = "Search"
        tabSearch.tabBarItem.image = UIImage(named: "Event.png")
        tabProfile = profile
        tabProfile.title = "Profile"
        tabProfile.tabBarItem.image = UIImage(named: "Profile.png")
            
        

        var tabs = [UIViewController]()
        tabs += [mainView, search, profile]
        self.viewControllers = tabs
        
    }
   
    override func viewWillAppear(_ animated: Bool) {
    
        super.viewWillAppear(animated)
        
        self.tabBar.barTintColor = .black
        self.tabBar.tintColor = UIColor.init(red: 218, green: 143, blue: 190, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
