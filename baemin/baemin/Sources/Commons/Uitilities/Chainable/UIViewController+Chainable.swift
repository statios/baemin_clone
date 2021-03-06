//
//  UIViewController+Chainable.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import UIKit

extension UIViewController: Chainable { }

extension Chain where Origin: UIViewController {
  
  @discardableResult
  func title(_ by: String?) -> Chain {
    self.origin.title = by
    return self
  }
  
  @discardableResult
  func setTabBarItem(_ tabBarItem: UITabBarItem) -> Chain {
    self.origin.tabBarItem = tabBarItem
    return self
  }
}
