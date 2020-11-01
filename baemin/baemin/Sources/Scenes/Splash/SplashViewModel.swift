//
//  SplashViewModel.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import RxSwift
import RxCocoa

class SplashViewModel: ViewModel {
  @Injected var splashInteractor: SplashInteractable
}

extension SplashViewModel {
  struct Event {
    let onAppear: Observable<Void>
  }
  
  struct State {
    let showMain: Driver<Void>
    let errorMessage: Driver<String>
  }
  
  func reduce(event: Event) -> State {
    let delay = event.onAppear.delay(.seconds(3), scheduler: MainScheduler.instance)
    let splashRequest = requestHome(trigger: event.onAppear)
    let splashSuccess = splashRequest.filter { $0.isSuccess }.compactMap { $0.data }
    let splashFailure = splashRequest.filter { !$0.isSuccess}.compactMap { $0.message }
    return State(
      showMain: Observable.zip(delay, splashSuccess).void().asDriver(),
      errorMessage: splashFailure.asDriver(onErrorJustReturn: "-")
    )
  }
}

extension SplashViewModel {
  func requestHome(trigger: Observable<Void>) -> Observable<BaeminResponse<Splash>> {
    trigger
      .compactMap { [weak self] in self?.splashInteractor }
      .flatMapLatest { $0.requestHome() }
      .share()
  }
}
