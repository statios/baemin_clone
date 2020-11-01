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
  }
  
  struct State {
  }
  
  func reduce(event: Event) -> State {
    return State()
  }
}

extension HomeViewModel {
}

