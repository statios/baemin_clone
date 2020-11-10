//
//  ListViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import UIKit
import RxSwift
import Resolver

class ListViewController: BasePageViewController {
  @Injected var viewModel: ListViewModel
  @Injected var navigator: ListNavigator
  
  let refreshButton = UIButton()
}

extension ListViewController {
  override func initialize() {
    super.initialize()
    navigator.setPageViewControllers(target: self)
  }
  
  override func setupUI() {
    super.setupUI()
    self.asChainable()
      .pageBar(style: .fit)
      .selectedText(color: Color.black)
      .unselectedText(color: Color.doveGray)
      .selectedText(font: Font.medium.bold())
      .unselectedText(font: Font.medium)
    
    refreshButton.asChainable()
      .image(Image.Icon.refresh24, for: .normal)
      .addBarButtonItem(self, position: .right)
  }
}

extension ListViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = ListViewModel.Event(
      tapRefresh: refreshButton.rx.tap.void()
    )
    let state = viewModel.reduce(event: event)
  }
}
