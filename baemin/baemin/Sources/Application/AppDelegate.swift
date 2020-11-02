//
//  AppDelegate.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
  -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    AppNavigator.shared.presentSplashScene(target: window)
    return true
  }
}
