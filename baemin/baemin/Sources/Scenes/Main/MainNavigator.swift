//
//  MainNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/30.
//

import UIKit

class MainNavigator: BaseNavigator {
  
  @Injected var baeminService: BaeminService
  @Injected var mainInteractor: MainInteractable
  @Injected var mainViewModel: MainViewModel
  
  func setViewControllers(target: MainViewController) {

    Dependencies {
      Dependency { self.baeminService }
      Dependency { self.mainInteractor }
      Dependency { self.mainViewModel }
      Dependency { HomeViewModel() }
      Dependency { HomeInteractor() }
      Dependency { SuggestViewModel() }
      Dependency { SuggestInteractor() }
      Dependency { ListViewModel() }
      Dependency { ListInteractor() }
      Dependency { LikeViewModel() }
      Dependency { LikeInteractor() }
      Dependency { UserViewModel() }
      Dependency { UserInteractor() }
      Dependency { HomeViewController() }
      Dependency { SuggestViewController() }
      Dependency { ListViewController() }
      Dependency { LikeViewController() }
      Dependency { UserViewController() }
    }.resolvedViewControllers { viewControllers in
      let navigationControllers = viewControllers.enumerated()
        .map { (offset, viewController) -> BaseNavigationController in
          let navigationController = BaseNavigationController(rootViewController: viewController)
          let mainTabBarItems = MainTabBarItem.allCases
          viewController.title = mainTabBarItems[offset].title
          viewController.tabBarItem.image = mainTabBarItems[offset].image
          viewController.tabBarItem.selectedImage = mainTabBarItems[offset].selectedImage
          return navigationController
        }
      target.setViewControllers(navigationControllers, animated: true)
    }
  }
}

