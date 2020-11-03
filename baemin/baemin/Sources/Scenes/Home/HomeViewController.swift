//
//  HomeViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import UIKit
import RxSwift

class HomeViewController: BasePageViewController {
  @Injected var viewModel: HomeViewModel
  @Injected var navigator: HomeNavigator
}

extension HomeViewController {
  override func setupUI() {
    super.setupUI()
    navigator.setPageViewControllers(target: self)
    pageBar(style: .fit)
    selectedText(color: Color.cyan)
    unselectedText(color: Color.black)
    selected(font: Font.medium.bold())
    unselected(font: Font.medium)
  }
}

extension HomeViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = HomeViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}
