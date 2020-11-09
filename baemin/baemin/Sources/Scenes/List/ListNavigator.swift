//
//  ListNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//
import Resolver

class ListNavigator: BaseNavigator {
  @Injected var deliveryListViewController: DeliveryListViewController
  @Injected var bmartListViewController: BmartListViewController
}

extension ListNavigator {
  
  func setPageViewControllers(target: ListViewController) {
    let listPageBarItems = ListPageBarItem.allCases
    let viewControllers = [deliveryListViewController, bmartListViewController]
    viewControllers.enumerated().forEach { (offset, viewController) in
      viewController.title = listPageBarItems[offset].title
    }
    target.setPageViewControllers(viewControllers)
  }
}
