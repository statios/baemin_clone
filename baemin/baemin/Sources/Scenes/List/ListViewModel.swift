//
//  ListViewModel.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import RxSwift
import RxCocoa

class ListViewModel: ViewModel {
  @Injected var mainInteractor: MainInteractable
  @Injected var listInteractor: ListInteractable
}

extension ListViewModel {
  struct Event {
  }
  
  struct State {
  }
  
  func reduce(event: Event) -> State {
    return State()
  }
}

extension ListViewModel {
}

