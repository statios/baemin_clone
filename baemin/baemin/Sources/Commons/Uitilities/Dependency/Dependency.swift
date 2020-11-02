//
//  Dependency.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

///Dependency Resolver
///Provide block which returns an object we want to inject into dependency container.
struct Dependency {
  typealias ResolveBlock<T> = () -> T

  private(set) var value: Any!
  private let resolveBlock: ResolveBlock<Any>
  let name: String

  init<T>(_ block: @escaping ResolveBlock<T>) {
    resolveBlock = block
    name = String(describing: T.self)
  }

  mutating func resolve() {
    value = resolveBlock()
  }
}

