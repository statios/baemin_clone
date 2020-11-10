//
//  ViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import UIKit
import RxSwift
import Resolver

class SplashViewController: BaseViewController {
  @Injected var viewModel: SplashViewModel
  @Injected var navigator: SplashNavigator
  
  var midLogoImageView = BaseImageView()
  var bottomLogoImageView = BaseImageView()
}

extension SplashViewController {
  override func setupUI() {
    super.setupUI()
    midLogoImageView.asChainable()
      .image(Image.Illust.splashLogo)
      .contentMode(.scaleAspectFit)
      .add(to: view)
      .makeConstraints { make in
        make.center.equalToSuperview()
        make.width.equalTo(220)
        make.height.equalTo(120)
      }
    
    bottomLogoImageView.asChainable()
      .image(Image.Illust.splashLogoBottom)
      .contentMode(.scaleAspectFit)
      .add(to: view)
      .makeConstraints { make in
        make.centerX.equalToSuperview()
        make.bottom.equalToSuperview().offset(-Padding.large)
        make.width.equalTo(128)
        make.height.equalTo(64)
      }
  }
}

extension SplashViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = SplashViewModel.Event(
      onAppear: rx.viewWillAppear.void()
    )
    let state = viewModel.reduce(event: event)
    state.presentMain
      .drive(onNext: { [weak self] in
        self?.navigator.presentMainScene(target: self)
      }).disposed(by: disposeBag)
    
    state.errorMessage
      .drive(onNext: {
        print($0)
      }).disposed(by: disposeBag)
  }
}
