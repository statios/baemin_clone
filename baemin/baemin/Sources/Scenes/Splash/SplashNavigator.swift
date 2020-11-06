//
//  SplashNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import UIKit

class SplashNavigator: BaseNavigator {
  @Injected var mainNavigator: MainNavigator
  @Injected var mainViewController: MainViewController
}

extension SplashNavigator {
  private func build() {
    Dependencies {
      Dependency { MainNavigator() }
      Dependency { MainViewController() }
      Dependency { MainViewModel() }
      Dependency { MainInteractor() }
    }.add()
  }
  func presentMainScene(target: UIViewController?) {
    build()
    mainViewController.modalTransitionStyle = .crossDissolve
    mainViewController.modalPresentationStyle = .overFullScreen
    mainNavigator.setViewController(target: mainViewController)
    target?.present(mainViewController, animated: true)
  }
}

