//
//  ActivityIndicatorPresenter.swift
//  baemin
//
//  Created by Stat.So on 2020/11/05.
//

import UIKit
import Lottie

final class ActivityIndicatorPrsenter {
  
  enum State {
    case shown
    case hidden
  }
  
  var indicatorState = State.hidden
  
  let animationView: LottieAnimationView = {
    let view = LottieAnimationView()
    view.setup(animationName: "loading_indicator", loopMode: .loop)
    view.layer.borderWidth = 1
    return view
  }()
  
  public func show() {
    guard indicatorState != .shown else {
      return
    }
    UIApplication.shared.keyWindow?.isUserInteractionEnabled = false
    UIApplication.shared.keyWindow?.addSubview(animationView)
    indicatorState = .shown
    animationView.playAnimation()
    animationView.snp.makeConstraints { (make) in
      make.center.equalToSuperview()
      make.size.equalTo(64)
    }
  }
  
  public func hide() {
    guard indicatorState != .hidden else {
      return
    }
    UIApplication.shared.keyWindow?.isUserInteractionEnabled = true
    indicatorState = .hidden
    animationView.stopAnimation()
    animationView.removeFromSuperview()
  }
  
}

