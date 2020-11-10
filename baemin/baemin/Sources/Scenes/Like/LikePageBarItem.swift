//
//  LikePageBarItem.swift
//  baemin
//
//  Created by Stat.So on 2020/11/04.
//

import UIKit

enum LikePageBarItem: CaseIterable {
  case store
  case direct
  case phone
}
extension LikePageBarItem {
  var title: String {
    switch self {
    case .store: return Text.favoriteStore
    case .direct: return Text.directPayment
    case .phone: return Text.phoneOrder
    }
  }
  var viewController: UIViewController {
    var viewController: UIViewController
    switch self {
    case .store: viewController = StoreViewController()
    case .direct: viewController = DirectViewController()
    case .phone: viewController = PhoneViewController()
    }
    viewController.title = self.title
    return viewController
  }
}
