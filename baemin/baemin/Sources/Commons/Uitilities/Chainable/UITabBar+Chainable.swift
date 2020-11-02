//
//  UITabBar+Chainable.swift
//  baemin
//
//  Created by Stat.So on 2020/11/02.
//

import UIKit

extension Chain where Origin: UITabBar {
  
  @discardableResult
  func tint(color: UIColor?) -> Chain {
    self.origin.tintColor = color
    return self
  }

  @discardableResult
  func unselectedItemTint(color: UIColor?) -> Chain {
    self.origin.unselectedItemTintColor = color
    return self
  }
  
  @discardableResult
  func barTint(color: UIColor?) -> Chain {
    self.origin.barTintColor = color
    return self
  }
  
}
