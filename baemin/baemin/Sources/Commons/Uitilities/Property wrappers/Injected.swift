//
//  Injected.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

@propertyWrapper
struct Injected<Dependency> {

  var dependency: Dependency! // resolved dependency

  var wrappedValue: Dependency {
    mutating get {
      if dependency == nil {
        let copy: Dependency = Dependencies.shared.resolve()
        self.dependency = copy
      }
      return dependency
    } mutating set {
      dependency = newValue
    }
  }

}
