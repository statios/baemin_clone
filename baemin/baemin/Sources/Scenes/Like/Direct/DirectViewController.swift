//
//  DirectViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/11/04.
//

import UIKit
import RxSwift

class DirectViewController: BaseViewController {
  
  @Injected var viewModel: DirectViewModel
  @Injected var navigator: LikeNavigator
  
}

extension DirectViewController {
  override func setupUI() {
    super.setupUI()
    view.backgroundColor = .yellow
  }
}

extension DirectViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = DirectViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}
