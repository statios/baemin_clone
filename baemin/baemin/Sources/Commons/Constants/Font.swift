//
//  Font.swift
//  baemin
//
//  Created by Stat.So on 2020/10/30.
//

import UIKit

struct Font {
  static let small = UIFont.systemFont(ofSize: 14)
  static let medium = UIFont.systemFont(ofSize: 18)
  static let large = UIFont.systemFont(ofSize: 24)
  static let extraLarge = UIFont.systemFont(ofSize: 32)
}

extension UIFont {
  @discardableResult
  func bold() -> UIFont {
    return UIFont.boldSystemFont(ofSize: self.pointSize)
  }
}
