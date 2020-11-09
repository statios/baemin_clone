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
    Resolver.registerDeliveryScene()
    Resolver.registerVisitScene()
    let homePageBarItems = HomePageBarItem.allCases
    let viewControllers = [DeliveryViewController(), VisitViewController()]
    viewControllers.enumerated().forEach { (offset, viewController) in
      viewController.title = homePageBarItems[offset].title
    }
    target.setPageViewControllers(viewControllers)
  }
  
  func pushToAlarmScene(target: UIViewController?) {
    Resolver.registerAlarmScene()
    target?.navigationController?.pushViewController(AlarmViewController(), animated: true)
  }
  
  func popToHomeFromAlarm(target: UIViewController?) {
    target?.navigationController?.popViewController(animated: true)
  }
  
  func pushToQrcodeScene(target: UIViewController?) {
    Resolver.registerQrcodeScene()
    target?.navigationController?.pushViewController(QrcodeViewController(), animated: true)
  }
//  
  func popToHomeFromQrcode(target: UIViewController?) {
    target?.navigationController?.popViewController(animated: true)
  }
}

extension Resolver {
  fileprivate static func registerDeliveryScene() {
    register { DeliveryViewModel() }
      .scope(shared)
  }
  fileprivate static func registerVisitScene() {
    register { VisitViewModel() }
      .scope(shared)
  }
  fileprivate static func registerQrcodeScene() {
    register { QrcodeViewModel() }
      .scope(shared)
  }
  fileprivate static func registerAlarmScene() {
    register { AlarmViewModel() }
      .scope(shared)
  }
}
