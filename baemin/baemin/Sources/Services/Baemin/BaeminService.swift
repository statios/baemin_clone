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
  
  typealias Router = BaeminAPI
  
  static private let sharedManager: Alamofire.Session = {
    let configuration = URLSessionConfiguration.default
    configuration.headers = HTTPHeaders.default
    configuration.timeoutIntervalForRequest = 120
    configuration.timeoutIntervalForResource = 120
    configuration.requestCachePolicy = NSURLRequest.CachePolicy.useProtocolCachePolicy
    return Alamofire.Session(configuration: configuration)
  }()
  
  let provider = MoyaProvider<BaeminAPI>(
    endpointClosure: MoyaProvider.defaultEndpointMapping,
    requestClosure: MoyaProvider<BaeminAPI>.defaultRequestMapping,
    stubClosure: MoyaProvider.immediatelyStub,
    callbackQueue: nil,
    session: sharedManager,
    plugins: [],
    trackInflights: false
  )
  
  public func request<T: Codable>(
    to router: BaeminAPI,
    type: T.Type,
    indicator: Bool = false)
  -> Single<BaeminResponse<T>> {
    return provider.rx.request(router).map(BaeminResponse<T>.self)
  }
  
}

