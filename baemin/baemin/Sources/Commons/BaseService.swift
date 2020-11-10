//
//  BaseService.swift
//  baemin
//
//  Created by Stat.So on 2020/11/10.
//

class BaseService {
  init() {
    Log.verbose(String(describing: Self.self))
  }
  deinit {
    Log.verbose(String(describing: Self.self))
  }
}
