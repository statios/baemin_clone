//
//  MainInteractor.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import RxSwift
import RxCocoa
import Resolver

protocol MainInteractable {
  var baeminService: BaeminServiceType { get set }
}

class MainInteractor: MainInteractable {
  @Injected var baeminService: BaeminServiceType
}
