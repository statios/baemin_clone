//
//  ListPageItem.swift
//  baemin
//
//  Created by Stat.So on 2020/11/04.
//

import UIKit

enum ListPageBarItem: CaseIterable {
  case delivery, bmart
}
extension ListPageBarItem {
  var title: String {
    switch self {
    case .delivery: return Text.deliveryPackVisit
    case .bmart: return Text.bmart
    }
  }
  var viewController: UIViewController {
    var viewController: UIViewController
    switch self {
    case .delivery: viewController = DeliveryListViewController()
    case .bmart: viewController = BmartListViewController()
    }
    viewController.title = self.title
    return viewController
  }
}
