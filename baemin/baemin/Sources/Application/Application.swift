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
}

extension Application: UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil)
  -> Bool {
    
    Dependencies {
      Dependency { SplashViewModel() }
      Dependency { SplashNavigator() }
      Dependency { SplashInteractor() }
      Dependency { BaeminService() }
    }.build()
    
    return true
  }
}

extension Application {
  func createKeyWindow() -> UIWindow {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = SplashViewController()
    window.makeKeyAndVisible()

    return window
  }
}
