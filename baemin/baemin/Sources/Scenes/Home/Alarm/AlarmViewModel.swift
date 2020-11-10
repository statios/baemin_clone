//
//  AlarmViewModel.swift
//  baemin
//
//  Created by Stat.So on 2020/11/04.
//

import RxSwift
import RxCocoa
import Resolver

class AlarmViewModel: BaseViewModel, ViewModel {

}

extension AlarmViewModel {
  struct Event {
    let tapBack: Observable<Void>
  }
  
  struct State {
    let popToHome: Driver<Void>
  }
  
  func reduce(event: Event) -> State {
    return State(
      popToHome: event.tapBack.asDriver()
    )
  }
}

extension AlarmViewModel {
}

