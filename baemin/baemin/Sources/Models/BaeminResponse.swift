//
//  BaeminResponse.swift
//  baemin
//
//  Created by Stat.So on 2020/10/29.
//

import Foundation

struct BaeminResponse<T: Codable>: Codable {
  var code: Int
  var message: String?
  var data: T?
}

extension BaeminResponse {
  var isSuccess: Bool {
    return code == 0
  }
}
