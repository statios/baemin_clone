//
//  RxSwift.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import RxSwift
import RxCocoa

extension ObservableType {
  
  public func void() -> Observable<Void> {
    return map { _ in }
  }
  
  public func unwrap<Result>() -> Observable<Result> where Element == Result? {
    return self.compactMap { $0 }
  }
  
}

extension ObservableConvertibleType where Element == Void {

  func asDriver() -> Driver<Element> {
    return self.asDriver(onErrorJustReturn: Void())
  }

}
