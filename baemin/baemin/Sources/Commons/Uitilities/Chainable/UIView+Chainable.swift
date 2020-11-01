//
//  UIView+Chainable.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import UIKit
import SnapKit

extension UIView: Chainable { }

extension Chain where Origin: UIView {
  
  @discardableResult
  func add(to: UIView) -> Chain {
    to.addSubview(self.origin)
    return self
  }
  
  @discardableResult
  func background(color: UIColor?) -> Chain {
    self.origin.backgroundColor = color
    return self
  }
  
  @discardableResult
  func makeConstraints(closure: (ConstraintMaker) -> Void) -> Chain {
    self.origin.snp.makeConstraints(closure)
    return self
  }
  
  @discardableResult
  func border(color: UIColor?) -> Chain {
    self.origin.layer.borderColor = color?.cgColor
    return self
  }
  
  @discardableResult
  func border(width: CGFloat) -> Chain {
    self.origin.layer.borderWidth = width
    return self
  }
  
  @discardableResult
  func corner(radius: CGFloat) -> Chain {
    self.origin.layer.cornerRadius = radius
    return self
  }

}
