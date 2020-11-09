//
//  StoreViewControllelr.swift
//  baemin
//
//  Created by Stat.So on 2020/11/04.
//

import UIKit
import RxSwift
import Resolver

class StoreViewController: BaseViewController {
  
  @Injected var viewModel: StoreViewModel
  @Injected var navigator: LikeNavigator
  
}

extension StoreViewController {
  override func setupUI() {
    super.setupUI()
    view.backgroundColor = .red
  }
}

extension StoreViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = StoreViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

