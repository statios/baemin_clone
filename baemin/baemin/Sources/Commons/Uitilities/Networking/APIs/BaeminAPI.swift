//
//  BaeminAPI.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import Foundation
import Moya

enum BaeminAPI {
  case splash
  case deliveryHome
  case alarms
}

extension BaeminAPI: TargetType {
  
  var baseURL: URL { //fake
    return URL(string: "http://api.baemin.com")!
  }
  
  var path: String { //fake
    switch self {
    case .splash: return "/splash"
    case .deliveryHome: return "/delivery/home"
    case .alarms: return "/alarms"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .splash: return .get
    case .deliveryHome: return .get
    case .alarms: return .get
    }
  }
  
  var sampleData: Data {
    switch self { //TODO refactoring
    case .splash:
      let path = Bundle.main.path(forResource: "Splash", ofType: "json")!
      let url = URL(fileURLWithPath: path)
      let data = try! Data(contentsOf: url)
      return data
    case .deliveryHome:
      let path = Bundle.main.path(forResource: "DeliveryHome", ofType: "json")!
      let url = URL(fileURLWithPath: path)
      let data = try! Data(contentsOf: url)
      return data
    case .alarms:
      let path = Bundle.main.path(forResource: "Alarms", ofType: "json")!
      let url = URL(fileURLWithPath: path)
      let data = try! Data(contentsOf: url)
      return data
    }
  }
  
  var task: Task {
    switch self {
    case .splash: return .requestPlain
    case .deliveryHome: return .requestPlain
    case .alarms: return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    return [:]
  }
}
