//
//  MainViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/10/30.
//

import UIKit
import RxSwift

class MainViewController: BaseTabBarController {
  @Injected var viewModel: MainViewModel
  @Injected var navigator: MainNavigator
}

extension MainViewController {
  override func setupUI() {
    super.setupUI()
    navigator.setViewControllers(target: self)
    tabBar.tintColor = Color.cyan
    
  }
}

extension MainViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = MainViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}
