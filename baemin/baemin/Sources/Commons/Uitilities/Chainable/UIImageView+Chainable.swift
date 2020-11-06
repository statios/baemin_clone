//
//  UIImageView+Chainable.swift
//  baemin
//
//  Created by Stat.So on 2020/11/06.
//

import UIKit

extension Chain where Origin: UIImageView {
  @discardableResult
  func image(_ by: UIImage?) -> Chain {
    self.origin.image = by
    return self
  }
}
