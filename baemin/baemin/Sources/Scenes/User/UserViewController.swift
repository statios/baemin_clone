//
//  UserViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import UIKit
import RxSwift

class UserViewController: BaseViewController {
  @Injected var viewModel: UserViewModel
  @Injected var navigator: UserNavigator
}

extension UserViewController {
  override func setupUI() {
    super.setupUI()
  }
}

extension UserViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = UserViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}
