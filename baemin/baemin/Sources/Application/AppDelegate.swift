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
  var application: Application = Application.shared
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
  -> Bool {
    
    _ = self.application.application(application,
                                     didFinishLaunchingWithOptions: launchOptions)
    window = self.application.createKeyWindow()
    
    return true
  }
}

