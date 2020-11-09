//
//  PhoneViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/11/04.
//

import UIKit
import RxSwift
import Resolver

class PhoneViewController: BaseViewController {
  
  @Injected var viewModel: PhoneViewModel
  @Injected var navigator: LikeNavigator
  
}

extension PhoneViewController {
  override func setupUI() {
    super.setupUI()
    view.backgroundColor = .green
  }
}

extension PhoneViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = PhoneViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

