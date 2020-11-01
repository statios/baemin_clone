//
//  LikeInteractor.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import RxSwift
import RxCocoa

protocol LikeInteractable {
  var baeminService: BaeminService { get set }
}

final class LikeInteractor {
  @Injected var baeminService: BaeminService
}

