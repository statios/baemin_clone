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
  static let shared = ActivityIndicatorPrsenter()
  
  let animationView: LottieAnimationView = {
    let view = LottieAnimationView()
    view.setup(animationName: "loading_indicator", loopMode: .loop)
    return view
  }()
  
  func show() {
    DispatchQueue.main.async {
      guard self.indicatorState != .shown else { return }
      UIApplication.shared.window?.isUserInteractionEnabled = false
      UIApplication.shared.window?.addSubview(self.animationView)
      self.indicatorState = .shown
      self.animationView.playAnimation()
      self.animationView.snp.makeConstraints { (make) in
        make.center.equalToSuperview()
        make.size.equalTo(64)
      }
    }
  }
  
  func hide() {
    DispatchQueue.main.async {
      guard self.indicatorState != .hidden else { return }
      UIApplication.shared.window?.isUserInteractionEnabled = true
      self.indicatorState = .hidden
      self.animationView.stopAnimation()
      self.animationView.removeFromSuperview()
    }
  }
  
}

