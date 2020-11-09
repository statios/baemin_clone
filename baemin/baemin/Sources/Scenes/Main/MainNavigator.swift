//
//  MainNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/30.
//

import UIKit
import Resolver

class MainNavigator: BaseNavigator {

}

extension Resolver {
  fileprivate static func registerHomeScene() {
    register { HomeInteractor() }
      .implements(HomeInteractable.self)
      .scope(application)
    register { HomeViewModel() }
      .scope(application)
    register { HomeNavigator() }
      .scope(application)
  }
}

extension MainNavigator {
  func setViewController(target: MainViewController) {
    Resolver.registerHomeScene()
    let mainTabBarItmes = MainTabBarItem.allCases
    let homeViewController = HomeViewController()
    let navigationControllers = [homeViewController]//,
//                                 suggestViewController,
//                                 likeViewController,
//                                 listViewController,
//                                 userViewController]
      .enumerated().map { (offset, viewController) -> BaseNavigationController in
        let navigationController = BaseNavigationController(rootViewController: viewController)
        viewController.title = mainTabBarItmes[offset].title
        viewController.tabBarItem.image = mainTabBarItmes[offset].image
        return navigationController
      }
    homeViewController.navigator.setPageViewControllers(target: homeViewController)
//    likeNavigator.setPageViewControllers(target: likeViewController)
//    listNavigator.setPageViewControllers(target: listViewController)
    target.setViewControllers(navigationControllers, animated: true)
  }
}

