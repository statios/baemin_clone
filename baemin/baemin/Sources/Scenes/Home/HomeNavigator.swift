//
//  HomeNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import RxSwift
import RxCocoa

class HomeNavigator: BaseNavigator {
  
  @Injected var deliveryViewController: DeliveryViewController
  @Injected var visitViewController: VisitViewController
  @Injected var alarmViewController: AlarmViewController
  @Injected var qrcodeViewController: QrcodeViewController
  @Injected var homeViewController: HomeViewController
  
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
  
  private var qrcodeSceneDependencies: Dependencies {
    Dependencies {
      Dependency { QrcodeViewController() }
      Dependency { QrcodeViewModel() }
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
  
  func pushToAlarmScene() {
    alarmSceneDependencies.add()
    homeViewController.navigationController?.pushViewController(alarmViewController, animated: true)
  }
  
  func popToHomeFromAlarm() {
    alarmViewController.navigationController?.popViewController(animated: true)
    alarmSceneDependencies.remove()
  }
  
  func pushToQrcodeScene() {
    qrcodeSceneDependencies.add()
    homeViewController.navigationController?.pushViewController(qrcodeViewController, animated: true)
  }
  
  func popToHomeFromQrcode() {
    qrcodeViewController.navigationController?.popViewController(animated: true)
    qrcodeSceneDependencies.remove()
  }
}
