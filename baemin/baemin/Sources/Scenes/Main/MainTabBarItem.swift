//
//  MainTabBarItem.swift
//  baemin
//
//  Created by Stat.So on 2020/11/02.
//

import UIKit

enum MainTabBarItem: CaseIterable {
  case home
  case suggest
  case list
  case like
  case user
}
extension MainTabBarItem {
  var title: String {
    switch self {
    case .home: return "home"
    case .suggest: return "suggest"
    case .list: return "list"
    case .like: return "like"
    case .user: return "user"
    }
  }
  var image: UIImage? {
    switch self {
    case .home: return UIImage()
    case .suggest: return UIImage()
    case .list: return UIImage()
    case .like: return UIImage()
    case .user: return UIImage()
    }
  }
  var selectedImage: UIImage? {
    switch self {
    case .home: return UIImage()
    case .suggest: return UIImage()
    case .list: return UIImage()
    case .like: return UIImage()
    case .user: return UIImage()
    }
  }
}
