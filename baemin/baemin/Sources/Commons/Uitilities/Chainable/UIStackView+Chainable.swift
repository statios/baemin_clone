//
//  UIStackView+Chainable.swift
//  baemin
//
//  Created by Stat.So on 2020/11/02.
//

import UIKit

extension Chain where Origin: UIStackView {
  @discardableResult
  func distribution(_ by: UIStackView.Distribution) -> Chain {
    self.origin.distribution = by
    return self
  }
  @discardableResult
  func axis(_ by: NSLayoutConstraint.Axis) -> Chain {
    self.origin.axis = by
    return self
  }
}
