//
//  MainViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/10/30.
//

import UIKit
import RxSwift

class MainViewController: BaseViewController {
  
  @Injected var viewModel: MainViewModel
  @Injected var navigator: MainNavigator

}

extension MainViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = MainViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

