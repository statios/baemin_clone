//
//  QrcodeViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/11/04.
//

import UIKit
import RxSwift

class QrcodeViewController: BaseViewController {
  
  @Injected var viewModel: QrcodeViewModel
  @Injected var navigator: HomeNavigator
  
}

extension QrcodeViewController {
  override func setupUI() {
    super.setupUI()
    self.asChainable()
      .title(Text.qrcodeOrder)
    view.backgroundColor = .systemPink
  }
}

extension QrcodeViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = QrcodeViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

