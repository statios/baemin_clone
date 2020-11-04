//
//  UIViewController+Extension.swift
//  baemin
//
//  Created by Stat.So on 2020/11/04.
//

import UIKit
import RxSwift

extension UIViewController {
  func barButtonItem(style: BarButtonItemStyle) -> UIBarButtonItem {
    var barButtonItem: UIBarButtonItem = UIBarButtonItem()
    switch style {
    case .back:
      self.navigationController?.interactivePopGestureRecognizer?.delegate = self
      self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
      barButtonItem.image = style.image
      barButtonItem.style = .plain
      barButtonItem.target = self
      barButtonItem.action =  #selector(back)
    case .close:
      barButtonItem.image = style.image
      barButtonItem.style = .plain
      barButtonItem.target = self
      barButtonItem.action =  #selector(disappear)
    case .custom(let customView):
      barButtonItem = UIBarButtonItem(customView: customView)
    }
    return barButtonItem
  }
  @objc func back() {
    self.navigationController?.popViewController(animated: true)
  }
  @objc func disappear() {
    self.dismiss(animated: true)
  }
}

extension UIViewController: UIGestureRecognizerDelegate {
  public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
  }
}
