//
//  AppNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/11/01.
//

import UIKit

class AppNavigator {
  
  static let shared = AppNavigator()
  
  func presentSplashScene(target: UIWindow?) {
    Dependencies {
      Dependency { SplashViewController() }
      Dependency { SplashViewModel() }
      Dependency { SplashInteractor() }
      Dependency { SplashNavigator() }
      Dependency { BaeminService() }
    }.resolvedViewController { viewController in
      target?.rootViewController = viewController
      target?.makeKeyAndVisible()
    }
  }
  
}
