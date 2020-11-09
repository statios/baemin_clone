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
  var baeminService: BaeminService { get set }
  func requestDeliveryHome() -> Single<BaeminResponse<DeliveryHome>>
}

final class HomeInteractor: HomeInteractable {
  @Injected var baeminService: BaeminService
  
  func requestDeliveryHome() -> Single<BaeminResponse<DeliveryHome>> {
    return baeminService.request(to: .deliveryHome,
                                 type: DeliveryHome.self,
                                 indicator: true)
  }
}

