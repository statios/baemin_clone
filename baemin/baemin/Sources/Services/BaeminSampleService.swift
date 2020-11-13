//
//  BaeminService.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import Moya
import RxSwift
import Alamofire
import Foundation
import RxMoya

protocol BaeminServiceType {
  var provider: NetworkProvider<BaeminAPI> { get }
}

extension BaeminServiceType {
  func request<T: Codable>(
    to router: BaeminAPI,
    type: T.Type,
    indicator: Bool = false)
  -> Single<BaeminResponse<T>> {
    return provider.rx.request(router)
      .showIndicator(indicator)
      .map(BaeminResponse<T>.self)
  }
}

class BaeminSampleService: BaseService, BaeminServiceType {
  let provider = NetworkProvider<BaeminAPI>(
    stubClosure: MoyaProvider.immediatelyStub) //Always call sample data
}

class BaeminService: BaseService, BaeminServiceType {
  let provider = NetworkProvider<BaeminAPI>(
    stubClosure: MoyaProvider.neverStub)
}
