//
//  MainNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/30.
//

import UIKit
import Resolver

class MainNavigator: BaseNavigator {

}

extension Resolver {
  fileprivate static func registerHomeScene() {
    register { HomeInteractor() }
      .implements(HomeInteractable.self)
      .scope(application)
    register { HomeViewModel() }
      .scope(application)
    register { HomeNavigator() }
      .scope(application)
  }
  fileprivate static func registerSuggestScene() {
    register { SuggestInteractor() }
      .implements(SuggestInteractable.self)
      .scope(application)
    register { SuggestViewModel() }
      .scope(application)
    register { SuggestNavigator() }
      .scope(application)
  }
  fileprivate static func registerLikeScene() {
    register { LikeInteractor() }
      .implements(LikeInteractable.self)
      .scope(application)
    register { LikeViewModel() }
      .scope(application)
    register { LikeNavigator() }
      .scope(application)
  }
  fileprivate static func registerListScene() {
    register { ListInteractor() }
      .implements(ListInteractable.self)
      .scope(application)
    register { ListViewModel() }
      .scope(application)
    register { ListNavigator() }
      .scope(application)
  }
  fileprivate static func registerUserScene() {
    register { UserInteractor() }
      .implements(UserInteractable.self)
      .scope(application)
    register { UserViewModel() }
      .scope(application)
    register { UserNavigator() }
      .scope(application)
  }
}

extension MainNavigator {
  func setViewController(target: MainViewController) {
    Resolver.registerHomeScene()
    Resolver.registerSuggestScene()
    Resolver.registerLikeScene()
    Resolver.registerListScene()
    Resolver.registerUserScene()
    let mainTabBarItmes = MainTabBarItem.allCases
      .map { BaseNavigationController(rootViewController: $0.viewController)}
    target.setViewControllers(mainTabBarItmes, animated: true)
  }
}

