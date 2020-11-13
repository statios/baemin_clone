//
//  AlarmViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/11/04.
//

import UIKit
import RxSwift
import Resolver

class AlarmViewController: BaseViewController {
  @Injected var viewModel: AlarmViewModel
  @Injected var navigator: HomeNavigator
  
  let backButton = UIButton()
}

extension AlarmViewController {
  override func setupUI() {
    super.setupUI()
    view.backgroundColor = .systemPurple
    self.asChainable()
      .title(Text.alarmCenter)
    backButton.asChainable()
      .setImage(Image.Icon.back24, for: .normal)
      .addBarButtonItem(self, position: .left)
  }
}

extension AlarmViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = AlarmViewModel.Event(
      tapBack: backButton.rx.tap.void()
    )
    let state = viewModel.reduce(event: event)
    
    state.popToHome
      .drive(onNext: { [weak self] in
        self?.navigationController?.popViewController(animated: true)
      }).disposed(by: disposeBag)
  }
}

