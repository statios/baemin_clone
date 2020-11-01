//
//  UITabBarItem+Chainable.swift
//  baemin
//
//  Created by Stat.So on 2020/11/01.
//

import UIKit

extension UITabBarItem: Chainable { }

extension Chain where Origin: UITabBarItem {
  
  @discardableResult
  func image(_ image: UIImage?) -> Chain {
    self.origin.image = image
    return self
  }

  @discardableResult
  func selectedImage(_ image: UIImage?) -> Chain {
    self.origin.selectedImage = image
    return self
  }
  
}
  
