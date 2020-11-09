//
//  BmartListViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/11/04.
//

import UIKit
import RxSwift
import Resolver

class BmartListViewController: BaseViewController {
  
  @Injected var viewModel: BmartListViewModel
  @Injected var navigator: ListNavigator
  
}

extension BmartListViewController {
  override func setupUI() {
    super.setupUI()
    view.backgroundColor = .yellow
  }
}

extension BmartListViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = BmartListViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

