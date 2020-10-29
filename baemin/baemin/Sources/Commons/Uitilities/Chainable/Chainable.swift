//
//  Chainable.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

class Chain<Origin> {
  
  var origin: Origin
  
  init(origin: Origin) {
    self.origin = origin
  }
  
}

protocol Chainable { }

extension Chainable {
  func asChainable() -> Chain<Self> {
    return Chain(origin: self)
  }
}
