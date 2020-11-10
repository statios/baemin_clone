//
//  BaseViewModel.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

protocol ViewModel {
  associatedtype Event
  associatedtype State
}

class BaseViewModel {
  init() {
    Log.verbose(String(describing: Self.self))
  }
  deinit {
    Log.verbose(String(describing: Self.self))
  }
}
