//
//  SplashNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import UIKit
import Resolver

class SplashNavigator: BaseNavigator {
}

extension Resolver {
  fileprivate static func registerMainScene() {
    register { MainInteractor() }
      .implements(MainInteractable.self)
      .scope(application)
    register { MainViewModel() }
      .scope(application)
    register { MainNavigator() }
      .scope(application)
  }
}

extension SplashNavigator {
  func presentMainScene(target: UIViewController?) {
    Resolver.registerMainScene()
    let viewController = MainViewController()
    viewController.modalTransitionStyle = .crossDissolve
    viewController.modalPresentationStyle = .overFullScreen
    target?.present(viewController, animated: true)
  }
}

