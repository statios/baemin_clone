//
//  HomeViewInteractor.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import RxSwift
import RxCocoa

protocol HomeInteractable {
  var baeminService: BaeminService { get set }
}

final class HomeInteractor {
  @Injected var baeminService: BaeminService
}

