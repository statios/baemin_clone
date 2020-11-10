//
//  BasePageViewController+Chainable.swift
//  baemin
//
//  Created by Stat.So on 2020/11/10.
//

import UIKit

extension Chain where Origin: BasePageViewController {
  @discardableResult
  func pageBar(style: PageBarStyle) -> Chain {
    self.origin.pageBar(style: style)
    return self
  }
  @discardableResult
  func selectedText(color: UIColor?) -> Chain {
    self.origin.selectedText(color: color)
    return self
  }
  @discardableResult
  func unselectedText(color: UIColor?) -> Chain {
    self.origin.unselectedText(color: color)
    return self
  }
  @discardableResult
  func selectedText(font: UIFont?) -> Chain {
    self.origin.selected(font: font)
    return self
  }
  @discardableResult
  func unselectedText(font: UIFont?) -> Chain {
    self.origin.unselected(font: font)
    return self
  }
}

