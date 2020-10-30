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
}

extension BaeminAPI: TargetType {
  
  var baseURL: URL {
    return URL(string: "http://dev-gateway.api.baemin.com")!
  }
  
  var path: String {
    switch self {
    case .splash: return "/splash"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .splash: return .get
    }
  }
  
  var sampleData: Data {
    switch self {
    case .splash:
      let path = Bundle.main.path(forResource: "Splash", ofType: "json")!
      let url = URL(fileURLWithPath: path)
      let data = try! Data(contentsOf: url)
      return data
    }
  }
  
  var task: Task {
    switch self {
    case .splash: return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    return [:]
  }
}
