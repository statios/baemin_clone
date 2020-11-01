//
//  LikeViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import UIKit
import RxSwift

class LikeViewController: BaseViewController {
  
  @Injected var viewModel: LikeViewModel
  @Injected var navigator: LikeNavigator
  
}

extension LikeViewController {
  override func setupUI() {
    super.setupUI()
  }
}

extension LikeViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = LikeViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

