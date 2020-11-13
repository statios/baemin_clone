//
//  AlarmViewModel.swift
//  baemin
//
//  Created by Stat.So on 2020/11/04.
//

import RxSwift
import RxCocoa
import Resolver

class AlarmViewModel: BaseViewModel, ViewModel {
  @Injected var homeInteractor: HomeInteractable
}

extension AlarmViewModel {
  struct Event {
    let onAppear: Observable<Void>
    let tapBack: Observable<Void>
  }
  
  struct State {
    let alarms: Driver<[Alarm]>
    let isEmpty: Driver<Bool>
    let popToHome: Driver<Void>
    let errorMessage: Driver<String>
  }
  
  func reduce(event: Event) -> State {
    let alarmsRequest = requestDeliveryHome(trigger: event.onAppear)
    let alarmsResponse = alarmsRequest.filter { $0.isSuccess }.compactMap { $0.data }
    let alarmsFailure = alarmsRequest.filter { !$0.isSuccess }.compactMap { $0.message }
    let alarms = alarmsResponse.filter { !$0.isEmpty }
    let empty = alarmsResponse.filter { $0.isEmpty }.void()
    let isEmpty = Observable.merge(alarms.map { _ in false },
                                   empty.map { true })
    return State(
      alarms: alarms.asDriver(onErrorJustReturn: []),
      isEmpty: isEmpty.asDriver(onErrorJustReturn: true),
      popToHome: event.tapBack.asDriver(),
      errorMessage: Observable.merge(alarmsFailure).asDriver(onErrorJustReturn: "-")
    )
  }
}

extension AlarmViewModel {
  private func requestDeliveryHome(
    trigger: Observable<Void>)
  -> Observable<BaeminResponse<[Alarm]>>{
    trigger
      .observeOn(ConcurrentDispatchQueueScheduler(qos: .default))
      .compactMap { [weak self] in self?.homeInteractor }
      .flatMapLatest { $0.requestAlarms() }
      .observeOn(MainScheduler.instance)
      .share()
  }
}

