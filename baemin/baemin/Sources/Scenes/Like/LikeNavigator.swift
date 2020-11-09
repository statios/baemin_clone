//
//  ListNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import Resolver

class LikeNavigator: BaseNavigator {
  @Injected var storeViewController: StoreViewController
  @Injected var directViewController: DirectViewController
  @Injected var phoneViewController: PhoneViewController
}

extension LikeNavigator {
  func setPageViewControllers(target: LikeViewController) {
    let likePageBarItems = LikePageBarItem.allCases
    let viewControllers = [storeViewController, directViewController, phoneViewController]
    viewControllers.enumerated().forEach { (offset, viewController) in
      viewController.title = likePageBarItems[offset].title
    }
    target.setPageViewControllers(viewControllers)
  }
}
