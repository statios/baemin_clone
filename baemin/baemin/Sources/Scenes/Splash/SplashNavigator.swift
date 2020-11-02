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
  @Injected var mainViewModel: MainViewModel
  @Injected var mainInteractor: MainInteractable
  @Injected var baeminService: BaeminService
}

extension SplashNavigator {
  private func build() {
    Dependencies {
      Dependency { MainNavigator() }
      Dependency { MainViewController() }
      Dependency { MainViewModel() }
      Dependency { MainInteractor() }
      Dependency { BaeminService() }
    }.build()
  }
  func presentMainScene(target: UIViewController?) {
    build()
    mainViewController.modalTransitionStyle = .crossDissolve
    mainViewController.modalPresentationStyle = .overFullScreen
    target?.present(mainViewController, animated: true)
  }
}

