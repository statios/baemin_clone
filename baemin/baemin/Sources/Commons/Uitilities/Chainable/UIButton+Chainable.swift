//
//  UIButton+Chainable.swift
//  baemin
//
//  Created by Stat.So on 2020/11/03.
//

import UIKit

extension Chain where Origin: UIButton {
  @discardableResult
  func color(_ by: UIColor?, for state: UIControl.State) -> Chain {
    self.origin.setTitleColor(by, for: state)
    return self
  }
  
  @discardableResult
  func image(_ by: UIImage?, for state: UIControl.State) -> Chain {
    self.origin.setImage(by, for: state)
    return self
  }
  
  @discardableResult
  func addBarButtonItem(_ target: UIViewController, position: Direction) -> Chain {
    let barButtonItem = UIBarButtonItem(customView: self.origin)
    if position == .left {
      target.navigationItem.leftBarButtonItem = barButtonItem
    } else if position == .right {
      target.navigationItem.rightBarButtonItem = barButtonItem
    }
    return self
  }
}

enum Direction: Int, Codable {
  case left = 0
  case right = 1
  case top = 2
  case bottom = 3
}
