//
//  LeftBarButtonStyle.swift
//  baemin
//
//  Created by Stat.So on 2020/11/04.
//

import UIKit

enum BarButtonItemStyle {
  case back
  case close
  case custom(customView: UIView)
}

extension BarButtonItemStyle {
  var image: UIImage? {
    switch self {
    case .back: return Image.Icon.back24
    case .close: return Image.Icon.close24
    case .custom: return nil
    }
  }
}
