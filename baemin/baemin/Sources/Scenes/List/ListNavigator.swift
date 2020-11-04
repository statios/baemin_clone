//
//  ListNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

class ListNavigator: BaseNavigator {
  @Injected var deliveryListViewController: DeliveryListViewController
  @Injected var bmartListViewController: BmartListViewController
}

extension ListNavigator {
  private func build() {
    Dependencies {
      Dependency{ DeliveryListViewController() }
      Dependency{ DeliveryListViewModel() }
      Dependency{ BmartListViewController() }
      Dependency{ BmartListViewModel() }
    }.add()
  }
  func setPageViewControllers(target: ListViewController) {
    build()
    let listPageBarItems = ListPageBarItem.allCases
    let viewControllers = [deliveryListViewController, bmartListViewController]
    viewControllers.enumerated().forEach { (offset, viewController) in
      viewController.title = listPageBarItems[offset].title
    }
    target.setPageViewControllers(viewControllers)
  }
}
