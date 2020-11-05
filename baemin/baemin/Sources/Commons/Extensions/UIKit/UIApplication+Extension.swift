//
//  UIApplication+Extension.swift
//  baemin
//
//  Created by Stat.So on 2020/11/05.
//

import UIKit

extension UIApplication {
  var keyWindow: UIWindow? {
    return self.windows.first { $0.isKeyWindow }
  }
}
