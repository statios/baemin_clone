//
//  MainViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/10/30.
//

import UIKit
import RxSwift

class MainViewController: BaseViewController {
  
  @Injected var viewModel: MainViewModel
  @Injected var navigator: MainNavigator

  var tabBar: UITabBar!
  
}

extension MainViewController {
  override func setupUI() {
    super.setupUI()
    tabBar = UITabBar()
    view.addSubview(tabBar)
    tabBar.snp.makeConstraints { (make) in
      make.leading.trailing.bottom.equalToSuperview()
      make.height.equalTo(88)
    }
  }
}

extension MainViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = MainViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}
