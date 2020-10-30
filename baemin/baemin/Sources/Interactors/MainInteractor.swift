//
//  MainInteractor.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import RxSwift
import RxCocoa

protocol MainInteractable {
  
}

class MainInteractor: MainInteractable {
  @Injected var baeminService: BaeminService
}
