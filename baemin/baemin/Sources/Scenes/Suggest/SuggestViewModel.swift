//
//  SuggestViewModel.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import RxSwift
import RxCocoa

class SuggestViewModel: ViewModel {
  @Injected var mainInteractor: MainInteractable
  @Injected var suggestInteractor: SuggestInteractable
}

extension SuggestViewModel {
  struct Event {
  }
  
  struct State {
  }
  
  func reduce(event: Event) -> State {
    return State()
  }
}

extension SuggestViewModel {
}
