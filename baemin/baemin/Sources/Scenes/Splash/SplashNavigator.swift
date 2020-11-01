//
//  SplashNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import UIKit

class SplashNavigator: BaseNavigator {
  
  @Injected var baeminService: BaeminService
  
  func presentMainScene(target: UIViewController?) {
    Dependencies {
      Dependency { MainViewModel() }
      Dependency { MainNavigator() }
      Dependency { MainViewController() }
      Dependency { MainInteractor() }
      Dependency { self.baeminService }
    }.resolvedViewController { viewController in
      viewController.modalTransitionStyle = .crossDissolve
      viewController.modalPresentationStyle = .fullScreen
      target?.present(viewController, animated: true)
    }
  }
}

