//
//  MainNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/30.
//

import UIKit
import Resolver

class MainNavigator: BaseNavigator {
  func setViewController(target: MainViewController) {
    let mainTabBarItmes = MainTabBarItem.allCases
      .map { BaseNavigationController(rootViewController: $0.viewController)}
    target.setViewControllers(mainTabBarItmes, animated: true)
  }
}

extension Resolver {
  static func registerMainScenes() {
    register { HomeInteractor() }.implements(HomeInteractable.self)
    register { HomeViewModel() }
    register { HomeNavigator() }.scope(shared)
    
    register { SuggestInteractor() }.implements(SuggestInteractable.self)
    register { SuggestViewModel() }
    register { SuggestNavigator() }.scope(shared)
    
    register { LikeInteractor() }.implements(LikeInteractable.self)
    register { LikeViewModel() }
    register { LikeNavigator() }.scope(shared)
    
    register { ListInteractor() }.implements(ListInteractable.self)
    register { ListViewModel() }
    register { ListNavigator() }.scope(shared)
    
    register { UserInteractor() }.implements(UserInteractable.self)
    register { UserViewModel() }
    register { UserNavigator() }.scope(shared)
  }
}
