//
//  DeliveryListViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/11/04.
//

import UIKit
import RxSwift
import Resolver

class DeliveryListViewController: BaseViewController {
  
  @Injected var viewModel: DeliveryListViewModel
  @Injected var navigator: ListNavigator
  
}

extension DeliveryListViewController {
  override func setupUI() {
    super.setupUI()
    view.backgroundColor = .red
  }
}

extension DeliveryListViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = DeliveryListViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

