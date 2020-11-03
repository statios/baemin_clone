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
  
}
