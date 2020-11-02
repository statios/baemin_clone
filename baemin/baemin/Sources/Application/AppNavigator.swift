//
//  AppNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/11/01.
//

import UIKit

class AppNavigator {
  static let shared = AppNavigator()
  
  @Injected var splashNavigator: SplashNavigator
  @Injected var splashViewController: SplashViewController
  @Injected var splashViewModel: SplashViewModel
  @Injected var splashInteractor: SplashInteractable
  @Injected var baeminService: BaeminService
  
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
