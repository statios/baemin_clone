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
      Dependency { BaeminService() }
      Dependency { SplashInteractor() }
      Dependency { SplashViewModel() }
      Dependency { SplashNavigator() }
      Dependency { SplashViewController() }
    }.resolvedViewController { (viewController) in
      target?.backgroundColor = Color.white
      target?.rootViewController = viewController
      target?.makeKeyAndVisible()
    }
  }
  
}
