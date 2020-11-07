//
//  Dependencies.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import UIKit

///Dependency Container
///Dependency container will manage added Depenedency objects.
class Dependencies {
  
  @_functionBuilder struct DependencyBuilder {
    static func buildBlock(_ dependency: Dependency) -> Dependency { dependency }
    static func buildBlock(_ dependencies: Dependency...) -> [Dependency] { dependencies }
  }
  
  convenience init(@DependencyBuilder _ dependencies: () -> [Dependency]) {
    self.init()
    dependencies().forEach { register($0) }
  }
  
  convenience init(@DependencyBuilder _ dependency: () -> Dependency) {
    self.init()
    register(dependency())
  }
  
  static private(set) var shared = Dependencies()
  
  fileprivate var dependencies = [Dependency]()
  
  func register(_ dependency: Dependency) {
    // Avoid duplicates
    guard dependencies.firstIndex(where: { $0.name == dependency.name }) == nil else {
      Log.info("\(String(describing: dependency.name)) already registered, ignoring")
      return
    }
    dependencies.append(dependency)
  }
  
  func build() {
    for index in dependencies.startIndex..<dependencies.endIndex {
      dependencies[index].resolve()
    }
    Self.shared = self
  }
  
  func add() {
    for index in dependencies.startIndex..<dependencies.endIndex {
      dependencies[index].resolve()
      Log.info(dependencies[index].name)
    }
    Self.shared.dependencies.append(contentsOf: dependencies)
  }
  
  func remove() {
    dependencies.forEach { currentDependency in
      Self.shared.dependencies.removeAll {
        let bool = $0.name == currentDependency.name
        if bool { Log.info($0.name) }
        return bool
      }
    }
  }
  
  func resolve<T>() -> T {
    guard let dependency = dependencies.first(where: { $0.value is T })?.value as? T else {
      Log.error(T.self)
      fatalError("Can't resolve \(T.self)")
    }
    return dependency
  }
  
}

extension Dependencies: Sequence {
  func makeIterator() -> AnyIterator<Any> {
    var iterator = dependencies.makeIterator()
    return AnyIterator { iterator.next()?.value }
  }
}

