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

struct BaeminService {
  
  let provider = NetworkProvider<BaeminAPI>()
  
  public func request<T: Codable>(
    to router: BaeminAPI,
    type: T.Type,
    indicator: Bool = false)
  -> Single<BaeminResponse<T>> {
    return provider.request(router, indicator: indicator)
      .map(BaeminResponse<T>.self)
  }
  
}
