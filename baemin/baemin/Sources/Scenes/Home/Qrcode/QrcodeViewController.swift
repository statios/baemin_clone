//
//  QrcodeViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/11/04.
//

import UIKit
import RxSwift
import Resolver

class QrcodeViewController: BaseViewController {
  @Injected var viewModel: QrcodeViewModel
  @Injected var navigator: HomeNavigator
  
  let closeButton = UIButton()
  let flashButton = UIButton()
}

extension QrcodeViewController {
  override func setupUI() {
    super.setupUI()
    
    self.asChainable()
      .title(Text.qrcodeOrder)
    
    view.asChainable()
      .background(color: .systemPink)
    
    closeButton.asChainable()
      .image(Image.Icon.close24, for: .normal)
      .addBarButtonItem(self, position: .left)
    
    flashButton.asChainable()
      .addBarButtonItem(self, position: .right)
  }
}

extension QrcodeViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = QrcodeViewModel.Event(
      tapFlash: flashButton.rx.tap.void(),
      tapClose: closeButton.rx.tap.void()
    )
    let state = viewModel.reduce(event: event)
    
    state.flash
      .drive(onNext: { [weak self] in
        self?.flashButton.setImage(
          $0 ? Image.Icon.flashOn24
             : Image.Icon.flashOff24,
          for: .normal)
      }).disposed(by: disposeBag)
    
    state.popToHome
      .drive(onNext: { [weak self] in
        self?.navigationController?.popViewController(animated: true)
      }).disposed(by: disposeBag)
  }
}

