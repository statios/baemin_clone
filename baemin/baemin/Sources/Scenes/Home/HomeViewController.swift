//
//  HomeViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import UIKit
import RxSwift

class HomeViewController: BaseViewController {
  @Injected var viewModel: HomeViewModel
  @Injected var navigator: HomeNavigator
}

extension HomeViewController {
  override func setupUI() {
    super.setupUI()
  }
}

extension HomeViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = HomeViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}
