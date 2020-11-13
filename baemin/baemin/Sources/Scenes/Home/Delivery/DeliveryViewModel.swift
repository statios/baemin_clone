//
//  DeliveryViewModel.swift
//  baemin
//
//  Created by Stat.So on 2020/11/02.
//

import UIKit
import RxSwift
import RxCocoa
import Resolver

class DeliveryViewModel: BaseViewModel, ViewModel {
  @Injected var homeInteractor: HomeInteractable
  
  struct Event {
    let onAppear: Observable<Void>
    let scrollBanner: Observable<CGPoint>
    let tapSearch: Observable<Void>
    let tapAllEvent: Observable<Void>
  }
  
  struct State {
    let topBanners: Driver<[Banner]>
    let topBannersCount: Driver<String>
    let topBannersIndex: Driver<String>
    let autoScroll: Driver<Void>
    let deliveryCategories: Driver<[DeliveryCategory]>
    let errorMessage: Driver<String>
  }
}

extension DeliveryViewModel {
  func reduce(event: Event) -> State {
    let deliveryHomeRequest = requestDeliveryHome(trigger: event.onAppear.take(1))
    let deliveryHomeResponse = deliveryHomeRequest.filter { $0.isSuccess }.compactMap { $0.data }
    let deliveryHomeFailure = deliveryHomeRequest.filter { !$0.isSuccess }.compactMap { $0.message }
    let topBanners = deliveryHomeResponse.map { $0.topBanners }.filter { !$0.isEmpty }
    let autoScroll = createAutoScroll(trigger: topBanners.void())
    let topBannersCount = topBanners.map { " / " + String($0.count) }
    let topBannersIndex = getTopBannerIndex(trigger: event.scrollBanner)
    let deliveryCategories = getDeliveryCategories(trigger: deliveryHomeRequest.void())
    
    event.tapAllEvent.debug().subscribe()
    event.tapSearch.debug().subscribe()
    return State(
      topBanners: topBanners.asDriver(onErrorJustReturn: []),
      topBannersCount: topBannersCount.asDriver(onErrorJustReturn: ""),
      topBannersIndex: topBannersIndex.asDriver(onErrorJustReturn: ""),
      autoScroll: autoScroll.asDriver(),
      deliveryCategories: deliveryCategories.asDriver(onErrorJustReturn: []),
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
  
  func createAutoScroll(trigger: Observable<Void>) -> Observable<Void> {
    trigger
      .flatMap {
        Observable<Int>.interval(
          .milliseconds(3500),
          scheduler: MainScheduler.instance)
      }.void()
  }
  
  func getTopBannerIndex(
    trigger contentOffset: Observable<CGPoint>)
  -> Observable<String> {
    contentOffset
      .map { Int($0.x/Device.width) + 1 }
      .distinctUntilChanged()
      .map { String($0) }
  }
  
  func getDeliveryCategories(
    trigger: Observable<Void>)
  -> Observable<[DeliveryCategory]> {
    trigger
      .map { _ -> [DeliveryCategory] in
        var categories = [DeliveryCategory]()
        categories.append(contentsOf: DeliveryCategory.allCases)
        categories.append(contentsOf: DeliveryCategory.allCases)
        return categories
      }
  }
}

