//
//  MainViewModel.swift
//  baemin
//
//  Created by Stat.So on 2020/10/30.
//

import RxSwift
import RxCocoa

class MainViewModel: ViewModel {
  @Injected var MainInteractor: MainInteractable
}

extension MainViewModel {
  struct Event {
  }
  
  struct State {
  }
  
  func reduce(event: Event) -> State {
    return State()
  }
}

extension MainViewModel {
}

