//
//  HomePageTabBarItem.swift
//  baemin
//
//  Created by Stat.So on 2020/11/03.
//

import Foundation

enum HomePageBarItem: CaseIterable {
  case delivery
  case visit
}
extension HomePageBarItem {
  var title: String {
    switch self {
    case .delivery: return Text.delivery
    case .visit: return Text.packVisit
    }
  }
}
