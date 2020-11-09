//
//  LikeViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import UIKit
import RxSwift
import Resolver

class LikeViewController: BasePageViewController {
  
  @Injected var viewModel: LikeViewModel
  @Injected var navigator: LikeNavigator
  
}

extension LikeViewController {
  override func setupUI() {
    super.setupUI()
    pageBar(style: .fit)
    selectedText(color: Color.black)
    unselectedText(color: Color.doveGray)
    selected(font: Font.medium.bold())
    unselected(font: Font.medium)
  }
}

extension LikeViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = LikeViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}

