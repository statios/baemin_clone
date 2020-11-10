//
//  ListNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import Resolver

class LikeNavigator: BaseNavigator {
  func setPageViewControllers(target: LikeViewController) {
    let likePageBarItems = LikePageBarItem.allCases.map { $0.viewController }
    target.setPageViewControllers(likePageBarItems)
  }
}

extension Resolver {
  static func registerLikeScenes() {
    register { StoreViewModel() }
    register { DirectViewModel() }
    register { PhoneViewModel() }
  }
}
