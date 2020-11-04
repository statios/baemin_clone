//
//  HomeNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

class HomeNavigator: BaseNavigator {
  
  @Injected var deliveryViewController: DeliveryViewController
  @Injected var visitViewController: VisitViewController
  @Injected var alarmViewController: AlarmViewController
  
  private func build() {
    Dependencies {
      Dependency { DeliveryViewController() }
      Dependency { DeliveryViewModel() }
      Dependency { VisitViewController() }
      Dependency { VisitViewModel() }
    }.add()
  }
  
  private var alarmSceneDependencies: Dependencies {
    Dependencies {
      Dependency { AlarmViewController() }
      Dependency { AlarmViewModel() }
    }
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
  
  func pushToAlarmScene(target: HomeViewController) {
    alarmSceneDependencies.add()
    target.navigationController?.pushViewController(alarmViewController, animated: true)
  }
  
  func popToHome(from: AlarmViewController) {
    alarmSceneDependencies.remove()
    from.navigationController?.popViewController(animated: true)
  }
}
