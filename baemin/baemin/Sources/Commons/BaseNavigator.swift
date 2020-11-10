//
//  BaseNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import UIKit

protocol Navigatable {
  
}

class BaseNavigator: Navigatable {
  init() {
    Log.verbose(String(describing: Self.self))
  }
  deinit {
    Log.verbose(String(describing: Self.self))
  }
}

