//
//  VisitViewModel.swift
//  baemin
//
//  Created by Stat.So on 2020/11/02.
//

import RxSwift
import RxCocoa
import Resolver

class VisitViewModel: BaseViewModel, ViewModel {
  @Injected var homeInteractor: HomeInteractable
}

extension VisitViewModel {
  struct Event {
  }
  
  struct State {
  }
  
  func reduce(event: Event) -> State {
    return State()
  }
}

extension VisitViewModel {
}

