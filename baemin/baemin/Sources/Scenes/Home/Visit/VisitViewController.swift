//
//  VisitViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/11/02.
//

import UIKit
import RxSwift

class VisitViewController: BaseViewController {
  
  @Injected var viewModel: VisitViewModel
  
}

extension VisitViewController {
  override func setupUI() {
    super.setupUI()
    view.backgroundColor = .brown
  }
}

extension VisitViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = VisitViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

