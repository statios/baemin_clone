//
//  ListPageItem.swift
//  baemin
//
//  Created by Stat.So on 2020/11/04.
//

import UIKit

enum ListPageBarItem: CaseIterable {
  case delivery, bmart
}
extension ListPageBarItem {
  var title: String {
    switch self {
    case .delivery: return Text.deliveryPackVisit
    case .bmart: return Text.bMart
    }
  }
}
