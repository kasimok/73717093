//
//  MainTabbarController.swift
//  73717093
//
//  Created by kasimok on 2022-09-23.
//

import Foundation
import UIKit


class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.presentTooltip(forTabAtIndex: 1)
        }
    }
    
    var imageView: UIImageView?
    
    private func presentTooltip(forTabAtIndex index: Int) {
        imageView?.removeFromSuperview()
        let (image, frame) = tabBar.snapshotDataForTab(atIndex: index)
        imageView = UIImageView(image: image)
        imageView?.contentMode = .scaleAspectFit
        imageView!.frame = CGRect(x: frame.width/2, y: 150, width: 150, height: 150)
        view.addSubview(imageView!)
    }
}

extension MainTabBarController:UITabBarControllerDelegate{
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item == (self.tabBar.items!)[0]{
            presentTooltip(forTabAtIndex: 1) //Screenshot of inactive tab
        }
        else if item == (self.tabBar.items!)[1]{
           presentTooltip(forTabAtIndex: 0) ////Screenshot of inactive tab
        }

    }
}
