//
//  SplashInteractor.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import RxSwift
import RxCocoa

protocol SplashInteractable {
  func requestHome() -> Single<BaeminResponse<Home>>
}

class SplashInteractor: SplashInteractable {
  @Injected var baeminService: BaeminService
  
  func requestHome() -> Single<BaeminResponse<Home>> {
    return baeminService.request(to: .home, type: Home.self)
  }
}
