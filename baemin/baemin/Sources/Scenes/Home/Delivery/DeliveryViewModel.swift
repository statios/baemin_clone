//
//  DeliveryViewModel.swift
//  baemin
//
//  Created by Stat.So on 2020/11/02.
//

import RxSwift
import RxCocoa
import Resolver

class DeliveryViewModel: ViewModel {
  @Injected var homeInteractor: HomeInteractable
  
  struct Event {
    let onAppear: Observable<Void>
  }
  
  struct State {
    let topBanners: Driver<[Banner]>
    let errorMessage: Driver<String>
  }
}

extension DeliveryViewModel {
  func reduce(event: Event) -> State {
    let deliveryHomeRequest = requestDeliveryHome(trigger: event.onAppear)
    let deliveryHomeResponse = deliveryHomeRequest.filter { $0.isSuccess }.compactMap { $0.data }
    let deliveryHomeFailure = deliveryHomeRequest.filter { !$0.isSuccess }.compactMap { $0.message }
    let topBanners = deliveryHomeResponse.map { $0.topBanners }.filter { !$0.isEmpty }
    return State(
      topBanners: topBanners.asDriver(onErrorJustReturn: []),
      errorMessage: Observable.merge(deliveryHomeFailure).asDriver(onErrorJustReturn: "-")
    )
  }
}

extension DeliveryViewModel {
  func requestDeliveryHome(
    trigger: Observable<Void>)
  -> Observable<BaeminResponse<DeliveryHome>> {
    trigger
      .observeOn(ConcurrentDispatchQueueScheduler(qos: .default))
      .compactMap { [weak self] in self?.homeInteractor }
      .flatMapLatest { $0.requestDeliveryHome() }
      .observeOn(MainScheduler.instance)
      .share()
  }
}

