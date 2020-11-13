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
  var baeminService: BaeminServiceType { get set }
}

final class SuggestInteractor: SuggestInteractable {
  @Injected var baeminService: BaeminServiceType
}

