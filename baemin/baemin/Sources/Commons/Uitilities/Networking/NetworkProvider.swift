//
//  NetworkingService.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import Moya
import RxSwift
import Alamofire
import Foundation

final class NetworkProvider<Target: TargetType>: MoyaProvider<Target> {
  
  override init(endpointClosure: @escaping MoyaProvider<Target>.EndpointClosure = MoyaProvider.defaultEndpointMapping,
                requestClosure: @escaping MoyaProvider<Target>.RequestClosure = MoyaProvider<Target>.defaultRequestMapping,
                stubClosure: @escaping MoyaProvider<Target>.StubClosure = MoyaProvider.immediatelyStub,
                callbackQueue: DispatchQueue? = nil,
                session: Session = MoyaProvider<Target>.defaultAlamofireSession(),
                plugins: [PluginType] = [],
                trackInflights: Bool = false) {
    super.init(endpointClosure: endpointClosure,
               requestClosure: requestClosure,
               stubClosure: stubClosure,
               callbackQueue: callbackQueue,
               session: session,
               plugins: [NetworkLoggerPlugin()],
               trackInflights: trackInflights
    )
  }
  
  func request(
    _ target: Target,
    indicator: Bool)
  -> Single<Response> {
    return self.rx.request(target)
      .showIndicator(indicator)
  }
}

extension PrimitiveSequence where Trait == SingleTrait, Element == Response {
  
  func showIndicator(_ isShow: Bool) -> Single<Element> {
    guard isShow else { return self }
    return self
      .observeOn(MainScheduler.asyncInstance)
      .do(onSuccess: { _ in
        //hide indicator
        Log.info("hide indicator")
      }, onError: { _ in
        //hide indicator
        Log.info("hide indicator")
      }, onSubscribe: {
        //show indicator
        Log.info("show indicator")
      })
  }
}
