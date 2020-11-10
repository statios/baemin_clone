//
//  UIScrollView+Chainable.swift
//  baemin
//
//  Created by Stat.So on 2020/11/10.
//

import UIKit

extension Chain where Origin: UIScrollView {
  @discardableResult
  func setRefreshControl(_ by: UIRefreshControl) -> Chain {
    self.origin.addSubview(by)
    return self
  }
}
