//
//  UserViewModel.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import RxSwift
import RxCocoa
import Resolver

class UserViewModel: BaseViewModel, ViewModel {
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


