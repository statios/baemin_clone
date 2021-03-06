//
//  UILabel+Chainable.swift
//  baemin
//
//  Created by Stat.So on 2020/11/02.
//

import UIKit

extension Chain where Origin: UILabel {
  @discardableResult
  func text(_ by: String?) -> Chain {
    self.origin.text = by
    return self
  }
  
  @discardableResult
  func textAlignment(_ by: NSTextAlignment) -> Chain {
    self.origin.textAlignment = by
    return self
  }
  
  @discardableResult
  func font(_ by: UIFont?) -> Chain {
    self.origin.font = by
    return self
  }
  
  @discardableResult
  func color(_ color: UIColor?) -> Chain {
    self.origin.textColor = color
    return self
  }
  
  @discardableResult
  func numberOfLines(_ lines: Int) -> Chain {
    self.origin.numberOfLines = lines
    return self
  }
}

