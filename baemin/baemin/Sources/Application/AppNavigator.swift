//
//  AppNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/11/01.
//

import UIKit

class AppNavigator {
  static let shared = AppNavigator()
  
  @Injected var splashViewController: SplashViewController
  
  private func build() {
    Dependencies {
      Dependency { BaeminService() }
      Dependency { SplashInteractor() }
      Dependency { SplashNavigator() }
      Dependency { SplashViewModel() }
      Dependency { SplashViewController() }
    }.build()
  }
  
  func presentSplashScene(target: UIWindow?) {
    build()
    target?.rootViewController = splashViewController
    target?.backgroundColor = .white
    target?.makeKeyAndVisible()
  }
  
}
