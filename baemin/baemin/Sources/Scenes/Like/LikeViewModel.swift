//
//  LikeViewModel.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import RxSwift
import RxCocoa
import Resolver

class LikeViewModel: ViewModel {
  @Injected var mainInteractor: MainInteractable
  @Injected var likeInteractor: LikeInteractable
}

extension LikeViewModel {
  struct Event {
  }
  
  struct State {
  }
  
  func reduce(event: Event) -> State {
    return State()
  }
}

extension LikeViewModel {
}

