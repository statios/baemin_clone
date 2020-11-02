//
//  DeliveryViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/11/02.
//

import UIKit
import RxSwift

class DeliveryViewController: BaseViewController {
  
  @Injected var viewModel: DeliveryViewModel
  
}

extension DeliveryViewController {
  override func setupUI() {
    super.setupUI()
    view.backgroundColor = .red
  }
}

extension DeliveryViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = DeliveryViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

