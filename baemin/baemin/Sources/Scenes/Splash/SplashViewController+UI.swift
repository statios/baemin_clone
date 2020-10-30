//
//  SplashViewController+UI.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import UIKit

extension SplashViewController {
  override func setupUI() {
    super.setupUI()
    
    view.asChainable()
      .background(color: Color.white)
    
    midLogoImageView = BaseImageView()
      .asChainable()
      .background(color: Color.empty)
      .add(to: view)
      .makeConstraints { make in
        make.center.equalToSuperview()
        make.width.equalTo(160)
        make.height.equalTo(72)
      }.origin
    
    bottomLogoImageView = BaseImageView()
      .asChainable()
      .background(color: Color.empty)
      .add(to: view)
      .makeConstraints { make in
        make.centerX.equalToSuperview()
        make.bottom.equalToSuperview().offset(-Padding.large)
        make.width.equalTo(128)
        make.height.equalTo(64)
      }.origin
    
    UIButton().asChainable()
      .add(to: view)
      .makeConstraints { (make) in
        make.trailing.equalToSuperview()
        make.size.equalTo(100)
        make.centerY.equalToSuperview()
      }
      .background(color: .red)
      .origin
      .rx.tap
      .subscribe(onNext: {
        self.navigator.presentMainScene(target: self)
      })
    
  }
}

