//
//  ListInteractor.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import RxSwift
import RxCocoa
import Resolver

protocol ListInteractable {
  var baeminService: BaeminService { get set }
}

final class ListInteractor: ListInteractable {
  @Injected var baeminService: BaeminService
}

