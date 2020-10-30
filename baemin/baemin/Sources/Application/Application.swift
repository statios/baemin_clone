//
//  Application.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import Foundation
import UIKit

class Application: NSObject {
  static let shared = Application()
  @Injected var splashScene: SplashViewController
}

extension Application: UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil)
  -> Bool {
    return true
  }
}

extension Application {
  func createKeyWindow() -> UIWindow {
    
    Dependencies {
      Dependency { SplashViewController() }
      Dependency { SplashViewModel() }
      Dependency { SplashInteractor() }
      Dependency { SplashNavigator() }
      Dependency { BaeminService() }
    }.build()
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = splashScene
    window.makeKeyAndVisible()
    return window
  }
  
}
