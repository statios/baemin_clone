//
//  ListNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import Resolver

class LikeNavigator: BaseNavigator {
}

extension Resolver {
  fileprivate static func registerStoreScene() {
    register { StoreViewModel() }
  }
  fileprivate static func registerDirectScene() {
    register { DirectViewModel() }
  }
  fileprivate static func registerPhoneScene() {
    register { PhoneViewModel() }
  }
}

extension LikeNavigator {
  func setPageViewControllers(target: LikeViewController) {
    Resolver.registerStoreScene()
    Resolver.registerDirectScene()
    Resolver.registerPhoneScene()
    let likePageBarItems = LikePageBarItem.allCases
    let viewControllers = [StoreViewController(), DirectViewController(), PhoneViewController()]
    viewControllers.enumerated().forEach { (offset, viewController) in
      viewController.title = likePageBarItems[offset].title
    }
    target.setPageViewControllers(viewControllers)
  }
}
