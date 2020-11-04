//
//  MainNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/30.
//

import UIKit

class MainNavigator: BaseNavigator {
  @Injected var homeViewController: HomeViewController
  @Injected var suggestViewController: SuggestViewController
  @Injected var listViewController: ListViewController
  @Injected var likeViewController: LikeViewController
  @Injected var userViewController: UserViewController
  @Injected var homeNavigator: HomeNavigator
  @Injected var likeNavigator: LikeNavigator
  @Injected var listNavigator: ListNavigator
}

extension MainNavigator {
  private func build() {
    Dependencies {
      Dependency { HomeNavigator() }
      Dependency { HomeViewController() }
      Dependency { HomeViewModel() }
      Dependency { HomeInteractor() }
      Dependency { SuggestNavigator() }
      Dependency { SuggestViewController() }
      Dependency { SuggestViewModel() }
      Dependency { SuggestInteractor() }
      Dependency { ListNavigator() }
      Dependency { ListViewController() }
      Dependency { ListViewModel() }
      Dependency { ListInteractor() }
      Dependency { LikeNavigator() }
      Dependency { LikeViewController() }
      Dependency { LikeViewModel() }
      Dependency { LikeInteractor() }
      Dependency { UserNavigator() }
      Dependency { UserViewController() }
      Dependency { UserViewModel() }
      Dependency { UserInteractor() }
    }.add()
  }
  func setViewController(target: MainViewController) {
    build()
    let mainTabBarItmes = MainTabBarItem.allCases
    let navigationControllers = [homeViewController,
                                 suggestViewController,
                                 likeViewController,
                                 listViewController,
                                 userViewController]
      .enumerated().map { (offset, viewController) -> BaseNavigationController in
        let navigationController = BaseNavigationController(rootViewController: viewController)
        viewController.title = mainTabBarItmes[offset].title
        viewController.tabBarItem.image = mainTabBarItmes[offset].image
        return navigationController
      }
    homeNavigator.setPageViewControllers(target: homeViewController)
    likeNavigator.setPageViewControllers(target: likeViewController)
    listNavigator.setPageViewControllers(target: listViewController)
    target.setViewControllers(navigationControllers, animated: true)
  }
}

