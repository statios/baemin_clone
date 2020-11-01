//
//  SplashNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import UIKit

class SplashNavigator: BaseNavigator {
  
  @Injected var mainScene: MainViewController
  
  // already registered objects
  @Injected var baeminService: BaeminService
  
  func presentMainScene(target: UIViewController?) {
    Dependencies {
      Dependency { MainViewModel() }
      Dependency { MainNavigator() }
      Dependency { MainViewController() }
      Dependency { MainInteractor() }
      Dependency { self.baeminService }
    }.build()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.mainScene.modalPresentationStyle = .fullScreen
      self.mainScene.modalTransitionStyle = .crossDissolve
      target?.present(self.mainScene, animated: true)
    }
    
  }
}

