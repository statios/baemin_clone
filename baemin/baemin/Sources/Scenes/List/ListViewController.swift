//
//  ListViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import UIKit
import RxSwift

class ListViewController: BasePageViewController {
  @Injected var viewModel: ListViewModel
  @Injected var navigator: ListNavigator
  
  let refreshButton = UIButton()
}

extension ListViewController {
  override func setupUI() {
    super.setupUI()
    pageBar(style: .fit)
    selectedText(color: Color.black)
    unselectedText(color: Color.doveGray)
    selected(font: Font.medium.bold())
    unselected(font: Font.medium)
    
    refreshButton.asChainable()
      .image(Image.Icon.refresh24, for: .normal)
      .addBarButtonItem(self, position: .right)
  }
}

extension ListViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = ListViewModel.Event()
    let state = viewModel.reduce(event: event)
  }
}
