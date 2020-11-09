//
//  ListNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//
import Resolver

class ListNavigator: BaseNavigator {
}

extension Resolver {
  fileprivate static func registerDeliveryListScene() {
    register { DeliveryListViewModel() }
  }
  fileprivate static func registerBmartListScene() {
    register { BmartListViewModel() }
  }
}

extension ListNavigator {
  
  func setPageViewControllers(target: ListViewController) {
    Resolver.registerDeliveryListScene()
    Resolver.registerBmartListScene()
    let listPageBarItems = ListPageBarItem.allCases
    let viewControllers = [DeliveryListViewController(), BmartListViewController()]
    viewControllers.enumerated().forEach { (offset, viewController) in
      viewController.title = listPageBarItems[offset].title
    }
    target.setPageViewControllers(viewControllers)
  }
}
