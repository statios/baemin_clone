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
  
  let alarmButton = UIButton()
  let qrcodeButton = UIButton()
}

extension HomeViewController {
  override func setupUI() {
    super.setupUI()
    navigator.setPageViewControllers(target: self)
    pageBar(style: .fill)
    selectedText(color: Color.cyan)
    unselectedText(color: Color.black)
    selected(font: Font.medium.bold())
    unselected(font: Font.medium)
    
    alarmButton.asChainable()
      .image(Image.Icon.alarm24, for: .normal)
      .addBarButtonItem(self, position: .left)
    
    qrcodeButton.asChainable()
      .image(Image.Icon.qrcode24, for: .normal)
      .addBarButtonItem(self, position: .right)
  }
}

extension HomeViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = HomeViewModel.Event(
      tapAlarm: alarmButton.rx.tap.void(),
      tapQrcode: qrcodeButton.rx.tap.void()
    )
    let state = viewModel.reduce(event: event)
    
    state.pushToAlarm
      .drive(onNext: { [weak self] in
        guard let `self` = self else { return }
        self.navigator.pushToAlarmScene(target: self)
      }).disposed(by: disposeBag)
  }
}
