//
//  ListViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import UIKit
import RxSwift

class ListViewController: BaseViewController {
  
  @Injected var viewModel: ListViewModel
  @Injected var navigator: ListNavigator
  
}

extension ListViewController {
  override func setupUI() {
    super.setupUI()
  }
}

extension ListViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = ListViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

