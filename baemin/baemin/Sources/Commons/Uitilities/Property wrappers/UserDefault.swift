//
//  UserDefault.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import Foundation

@propertyWrapper
struct UserDefault<T> {
  
  enum Key: String {
    case firstRunning
  }
  
  private let userDefault = UserDefaults.standard
  private let key: Key
  
  init(key: Key) {
    self.key = key
  }
  
  var wrappedValue: T? {
    get {
      guard let object = userDefault.object(forKey: key.rawValue) else {
        print("UserDefault.\(key.rawValue) is empty")
        return nil
      }
      guard let value = object as? T else {
        print("UserDefault.\(key.rawValue) can't cast to \(T.self)")
        return nil
      }
      return value
    } set {
      userDefault.set(newValue, forKey: key.rawValue)
    }
  }
  
}
