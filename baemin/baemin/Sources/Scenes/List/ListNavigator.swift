//
//  ListNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//
import Resolver

class ListNavigator: BaseNavigator {
  func setPageViewControllers(target: ListViewController) {
    let listPageBarItems = ListPageBarItem.allCases.map { $0.viewController }
    target.setPageViewControllers(listPageBarItems)
  }
}

extension Resolver {
  static func registerListScenes() {
    register { DeliveryListViewModel() }
    register { BmartListViewModel() }
  }
}
