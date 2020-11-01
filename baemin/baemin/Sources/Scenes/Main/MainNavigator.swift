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
      Dependency { HomeViewController() }
      Dependency { HomeViewModel() }
      Dependency { HomeInteractor() }
      Dependency { SuggestViewController() }
      Dependency { SuggestViewModel() }
      Dependency { SuggestInteractor() }
      Dependency { ListViewController() }
      Dependency { ListViewModel() }
      Dependency { ListInteractor() }
      Dependency { LikeViewController() }
      Dependency { LikeViewModel() }
      Dependency { LikeInteractor() }
      Dependency { UserViewController() }
      Dependency { UserViewModel() }
      Dependency { UserInteractor() }
    }.resolvedViewControllers { viewControllers in
      let navigationControllers = viewControllers.map { viewController -> BaseNavigationController in
        let navigationController = BaseNavigationController(rootViewController: viewController)
        viewController.title = "hi"
        return navigationController
      }
      target.setViewControllers(navigationControllers, animated: true)
    }
    
  }
}

