//
//  MainNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/30.
//

import UIKit

class MainNavigator: BaseNavigator {
  
  @Injected private var mainScene: MainViewController
  
  func presentMainScene(target: UIViewController) {
//    Dependencies {
//      Dependency { MainViewModel() }
//      Dependency { MainNavigator() }
//      Dependency { MainInteractor() }
//      Dependency { BaeminService() }
//    }.build()
    target.present(mainScene, animated: true)
  }
  
}

