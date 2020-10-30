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
    //resolve dependency
    target.present(mainScene, animated: true)
  }
}
