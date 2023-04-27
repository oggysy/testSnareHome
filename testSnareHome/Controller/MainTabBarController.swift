//
//  MainTabBarController.swift
//  testSnareHome
//
//  Created by 小木曽佑介 on 2023/04/27.
//

import UIKit


class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow

        let storyBoard = UIStoryboard(name: "ViewController", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ViewController")

        let vc1 = UINavigationController(rootViewController: vc)

        vc1.tabBarItem.image = UIImage(systemName: "house")

        vc1.title = "Home"


        tabBar.tintColor = .label
        setViewControllers([vc1], animated: true)

    }


}

