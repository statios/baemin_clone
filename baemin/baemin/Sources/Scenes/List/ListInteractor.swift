//
//  ListInteractor.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import RxSwift
import RxCocoa

protocol ListInteractable {
  var baeminService: BaeminService { get set }
}

final class ListInteractor {
  @Injected var baeminService: BaeminService
}

