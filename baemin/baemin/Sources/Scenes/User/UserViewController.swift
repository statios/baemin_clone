//
//  UserViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import UIKit
import RxSwift
import Resolver

class UserViewController: BaseViewController {
  @Injected var viewModel: UserViewModel
  @Injected var navigator: UserNavigator
}

extension UserViewController {
  override func setupUI() {
    super.setupUI()
    UIView().asChainable()
      .background(color: .red)
      .add(to: view)
      .makeConstraints { (make) in
        make.centerX.equalToSuperview()
        make.top.equalToSuperview()
        make.size.equalTo(100)
      }
  }
}

extension UserViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = UserViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}
