//
//  HomeViewInteractor.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import RxSwift
import RxCocoa
import Resolver

protocol HomeInteractable {
  var baeminService: BaeminServiceType { get set }
  func requestDeliveryHome() -> Single<BaeminResponse<DeliveryHome>>
  func requestAlarms() -> Single<BaeminResponse<[Alarm]>>
}

final class HomeInteractor: HomeInteractable {
  @Injected var baeminService: BaeminServiceType
  
  func requestDeliveryHome() -> Single<BaeminResponse<DeliveryHome>> {
    return baeminService.request(to: .deliveryHome,
                                 type: DeliveryHome.self,
                                 indicator: true)
  }
  
  func requestAlarms() -> Single<BaeminResponse<[Alarm]>> {
    return baeminService.request(to: .alarms,
                                 type: [Alarm].self,
                                 indicator: true)
  }
}

