//
//  HomeNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

class HomeNavigator: BaseNavigator {
  
  @Injected var deliveryViewController: DeliveryViewController
  @Injected var visitViewController: VisitViewController
  
  private func build() {
    Dependencies {
      Dependency { DeliveryViewController() }
      Dependency { DeliveryViewModel() }
      Dependency { VisitViewController() }
      Dependency { VisitViewModel() }
    }.add()
  }
  
  func setPageViewControllers(target: HomeViewController) {
    build()
    let homePageBarItems = HomePageBarItem.allCases
    let viewControllers = [deliveryViewController, visitViewController]
    viewControllers.enumerated().forEach { (offset, viewController) in
      viewController.title = homePageBarItems[offset].title
    }
    target.setPageViewControllers(viewControllers)
  }
}
