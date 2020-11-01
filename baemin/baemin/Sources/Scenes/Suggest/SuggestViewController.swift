//
//  SuggestViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import UIKit
import RxSwift

class SuggestViewController: BaseViewController {
  @Injected var viewModel: SuggestViewModel
  @Injected var navigator: SuggestNavigator
}

extension SuggestViewController {
  override func setupUI() {
    super.setupUI()
  }
}

extension SuggestViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = SuggestViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

