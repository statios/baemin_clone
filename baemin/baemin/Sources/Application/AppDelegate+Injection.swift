//
//  AppDelegate+Injection.swift
//  baemin
//
//  Created by Stat.So on 2020/11/09.
//

import Resolver
import UIKit

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    registerWindow()
    registerSplashScene()
    registerMainScenes()
    registerHomeScenes()
    registerLikeScenes()
    registerListScenes()
  }
  static func registerWindow() {
    register { UIWindow(frame: UIScreen.main.bounds) }
      .resolveProperties { (_, window) in
        window.rootViewController = SplashViewController()
        window.makeKeyAndVisible()
        window.backgroundColor = .white
      }.scope(application)
  }
  static func registerSplashScene() {
    register { SplashInteractor() }
      .implements(SplashInteractable.self)
    register { SplashViewModel() }
    register { SplashNavigator() }
    register { BaeminService() }.scope(shared)
  }
}
