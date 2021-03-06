//
//  LikeInteractor.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import RxSwift
import RxCocoa
import Resolver

protocol LikeInteractable {
  var baeminService: BaeminServiceType { get set }
}

final class LikeInteractor: LikeInteractable {
  @Injected var baeminService: BaeminServiceType
}

