//
//  QrcodeViewModel.swift
//  baemin
//
//  Created by Stat.So on 2020/11/04.
//

import RxSwift
import RxCocoa

class QrcodeViewModel: BaseViewModel, ViewModel {
  struct Event {
    let tapFlash: Observable<Void>
    let tapClose: Observable<Void>
  }
  
  struct State {
    let flash: Driver<Bool>
    let popToHome: Driver<Void>
  }
}

extension QrcodeViewModel {
  
  func reduce(event: Event) -> State {
    let initialFlash = Observable.just(false)
    let updatedFlash = event.tapFlash.scan(false) { (bool, _) in !bool }
    return State(
      flash: Observable.merge(initialFlash, updatedFlash).asDriver(onErrorJustReturn: false),
      popToHome: event.tapClose.asDriver()
    )
  }
}
