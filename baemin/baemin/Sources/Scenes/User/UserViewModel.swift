//
//  UserViewModel.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import RxSwift
import RxCocoa

class UserViewModel: ViewModel {
  @Injected var mainInteractor: MainInteractable
  @Injected var userInteractor: UserInteractable
}

extension UserViewModel {
  struct Event {
  }
  
  struct State {
  }
  
  func reduce(event: Event) -> State {
    return State()
  }
}

extension UserViewModel {
}


