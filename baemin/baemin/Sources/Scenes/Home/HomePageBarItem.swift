//
//  HomePageTabBarItem.swift
//  baemin
//
//  Created by Stat.So on 2020/11/03.
//

import UIKit

enum HomePageBarItem: CaseIterable {
  case delivery
  case visit
}
extension HomePageBarItem {
  var title: String {
    switch self {
    case .delivery: return Text.delivery
    case .visit: return Text.packVisit
    }
  }
  var viewController: UIViewController {
    var viewController: UIViewController
    switch self {
    case .delivery: viewController = DeliveryViewController()
    case .visit: viewController = VisitViewController()
    }
    viewController.title = self.title
    return viewController
  }
}
