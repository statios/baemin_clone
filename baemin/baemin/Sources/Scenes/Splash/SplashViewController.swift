//
//  ViewController.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import UIKit
import RxSwift

class SplashViewController: BaseViewController {
  
  @Injected var viewModel: SplashViewModel
  @Injected var navigator: SplashNavigator
  
  var midLogoImageView: BaseImageView!
  var bottomLogoImageView: BaseImageView!
  
}

extension SplashViewController {
  override func setupBinding() {
    super.setupBinding()
    let event = SplashViewModel.Event(
      onAppear: rx.viewDidAppear.void()
    )
    let state = viewModel.reduce(event: event)
    
    state.showMain
      .drive(onNext: { self.navigator.presentMainScene(target: self) })
      .disposed(by: disposeBag)
    
    state.errorMessage
      .drive(onNext: {
        print($0)
      }).disposed(by: disposeBag)
  }
}
