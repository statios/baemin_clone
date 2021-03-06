//
//  SplashInteractor.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import RxSwift
import RxCocoa
import Resolver

protocol SplashInteractable {
  var baeminService: BaeminServiceType { get set }
  func requestHome() -> Single<BaeminResponse<Splash>>
}

class SplashInteractor: SplashInteractable {
  @Injected var baeminService: BaeminServiceType
  
  func requestHome() -> Single<BaeminResponse<Splash>> {
    return baeminService.request(to: .splash, type: Splash.self)
  }
}
