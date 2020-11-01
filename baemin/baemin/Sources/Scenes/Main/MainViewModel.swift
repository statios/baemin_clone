//
//  MainViewModel.swift
//  baemin
//
//  Created by Stat.So on 2020/10/30.
//

import RxSwift
import RxCocoa

class MainViewModel: ViewModel {
  @Injected var mainInteractor: MainInteractable
}

extension MainViewModel {
  struct Event {
  }
  
  struct State {
  }
  
  func reduce(event: Event) -> State {
    print(mainInteractor.baeminService)
    return State()
  }
}

extension MainViewModel {
}

