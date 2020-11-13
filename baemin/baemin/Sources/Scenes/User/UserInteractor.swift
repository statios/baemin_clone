//
//  UserInteractor.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import RxSwift
import RxCocoa
import Resolver

protocol UserInteractable {
  var baeminService: BaeminServiceType { get set }
}

final class UserInteractor: UserInteractable {
  @Injected var baeminService: BaeminServiceType
}
