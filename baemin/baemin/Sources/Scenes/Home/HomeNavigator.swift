//
//  HomeNavigator.swift
//  baemin
//
//  Created by Stat.So on 2020/10/31.
//

import RxSwift
import RxCocoa
import Resolver
import UIKit

class HomeNavigator: BaseNavigator {
  
  func setPageViewControllers(target: HomeViewController) {
    let homePageBarItems = HomePageBarItem.allCases.map { $0.viewController }
    target.setPageViewControllers(homePageBarItems)
  }
  
  func pushToAlarmScene(target: UIViewController?) {
    target?.navigationController?.pushViewController(AlarmViewController(), animated: true)
  }
  
  func pushToQrcodeScene(target: UIViewController?) {
    target?.hidesBottomBarWhenPushed = true
    target?.navigationController?.pushViewController(QrcodeViewController(), animated: true)
    target?.hidesBottomBarWhenPushed = false
  }
}

extension Resolver {
  static func registerHomeScenes() {
    register { DeliveryViewModel() }
    register { VisitViewModel() }
    register { QrcodeViewModel() }
    register { AlarmViewModel() }
  }
}
