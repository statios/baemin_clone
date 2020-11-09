//
//  ListViewModel.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import RxSwift
import RxCocoa
import Resolver

class ListViewModel: ViewModel {
  @Injected var mainInteractor: MainInteractable
  @Injected var listInteractor: ListInteractable
  
  struct Event {
    let tapRefresh: Observable<Void>
  }
  
  struct State {
  }
}

extension ListViewModel {
  func reduce(event: Event) -> State {
    return State()
  }
}

extension ListViewModel {
}

