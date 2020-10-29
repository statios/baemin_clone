//
//  BaeminAPI.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import Foundation
import Moya

enum BaeminAPI {
  case home
}

extension BaeminAPI: TargetType {
  
  var baseURL: URL {
    return URL(string: "http://dev-gateway.api.baemin.com")!
  }
  
  var path: String {
    switch self {
    case .home: return "/home"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .home: return .get
    }
  }
  
  var sampleData: Data {
    switch self {
    case .home:
      let path = Bundle.main.path(forResource: "Home", ofType: "json")!
      let url = URL(fileURLWithPath: path)
      let data = try! Data(contentsOf: url)
      return data
    }
  }
  
  var task: Task {
    switch self {
    case .home: return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    return [:]
  }
}
