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
  }
}

extension DeliveryViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = DeliveryViewModel.Event(
      onAppear: rx.viewWillAppear.void()
    )
    let state = viewModel.reduce(event: event)
    state.topBanners
      .debug()
      .drive()
      .disposed(by: disposeBag)
    
    state.errorMessage
      .drive(onNext: { _ in
        //do error feedback
      }).disposed(by: disposeBag)
  }
}

