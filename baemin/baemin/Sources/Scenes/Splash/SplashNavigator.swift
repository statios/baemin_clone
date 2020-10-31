//
//  SplashNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import UIKit

class SplashNavigator: BaseNavigator {
  
  @Injected var mainScene: MainViewController
  
  func presentMainScene(target: UIViewController) {
    Dependencies {
      Dependency { MainViewModel() }
      Dependency { MainViewController() }
      Dependency { MainNavigator() }
      Dependency { MainInteractor() }
      Dependency { BaeminService() }
    }.build()
    target.present(mainScene, animated: true)
  }
}
