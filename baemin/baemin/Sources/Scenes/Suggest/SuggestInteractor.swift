//
//  SuggestInteractor.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import RxSwift
import RxCocoa
import Resolver

protocol SuggestInteractable {
  var baeminService: BaeminService { get set }
}

final class SuggestInteractor {
  @Injected var baeminService: BaeminService
}

