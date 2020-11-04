//
//  HomeViewModel.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import RxSwift
import RxCocoa

class HomeViewModel: ViewModel {
  @Injected var mainInteractor: MainInteractable
  @Injected var homeInteractor: HomeInteractable
}

extension HomeViewModel {
  struct Event {
    let tapAlarm: Observable<Void>
    let tapQrcode: Observable<Void>
  }
  
  struct State {
    let pushToAlarm: Driver<Void>
    let pushToQrcode: Driver<Void>
  }
  
  func reduce(event: Event) -> State {
    return State(
      pushToAlarm: event.tapAlarm.asDriver(),
      pushToQrcode: event.tapQrcode.asDriver()
    )
  }
}

extension HomeViewModel {
}

