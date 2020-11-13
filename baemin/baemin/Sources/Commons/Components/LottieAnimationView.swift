//
//  LottieView.swift
//  baemin
//
//  Created by Stat.So on 2020/11/05.
//

import Lottie
import UIKit

class LottieAnimationView: BaseView {
  
  enum AnimationStatus {
    case play
    case stop
    case pause
    case none
  }
  
  var animationView = AnimationView()
  
  private var animationStatus: AnimationStatus = .none
  
}

extension LottieAnimationView {
  override func setupUI() {
    super.setupUI()
    
    animationView.asChainable()
      .clipToBounds(false)
      .contentMode(.scaleAspectFit)
      .add(to: self)
      .makeConstraints { (make) in
        make.edges.equalToSuperview()
      }
  }
  
  override func setupBinding() {
    super.setupBinding()
  }
}

extension LottieAnimationView {
  func setup(animationName: String, loopMode: LottieLoopMode = .loop) {
    let animation = Animation.named(animationName, bundle: Bundle.main)
    animationView.loopMode = loopMode
    animationView.animation = animation
  }
  
  func playAnimation(completion:(() -> Void)? = nil) {
    animationStatus = .play
    animationView.play { (bool) in
      completion?()
    }
  }
  
  func pauseAnimation(completion:(() -> Void)? = nil) {
    animationStatus = .pause
    self.animationView.pause()
    completion?()
  }
  
  func stopAnimation(completion:(() -> Void)? = nil) {
    animationStatus = .stop
    self.animationView.stop()
    completion?()
  }
}

